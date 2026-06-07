-- 1. Calculate Author's Total Publications
CREATE OR REPLACE FUNCTION get_author_publications(author_id INT)
RETURNS INT AS $$
DECLARE
    publication_count INT;
BEGIN
    SELECT COUNT(*) INTO publication_count
    FROM ArticleAuthor
    WHERE AuthorID = author_id;
    
    RETURN publication_count;
END;
$$ LANGUAGE plpgsql;

-- 2. Check DOI Uniqueness
CREATE OR REPLACE FUNCTION check_doi_unique(new_doi VARCHAR(255))
RETURNS BOOLEAN AS $$
BEGIN
    RETURN NOT EXISTS (
        SELECT 1 FROM Article 
        WHERE DOI = new_doi
    );
END;
$$ LANGUAGE plpgsql;

-- 1. Archive Old Article Versions
CREATE OR REPLACE PROCEDURE archive_article_history(cutoff_date DATE)
AS $$
BEGIN
    CREATE TABLE IF NOT EXISTS Article_history_archive 
    (LIKE Article_history INCLUDING ALL);
    
    INSERT INTO Article_history_archive
    SELECT * FROM Article_history
    WHERE ValidTo < cutoff_date;
    
    DELETE FROM Article_history
    WHERE ValidTo < cutoff_date;
END;
$$ LANGUAGE plpgsql;

-- 2. Update Author Affiliation
CREATE OR REPLACE PROCEDURE update_author_affiliation(
    author_id INT,
    new_institution_id INT,
    effective_date DATE
)
AS $$
BEGIN
    -- End current affiliation
    UPDATE Affiliation
    SET EndDate = effective_date - INTERVAL '1 day'
    WHERE AuthorID = author_id 
      AND EndDate IS NULL;

    -- Add new affiliation
    INSERT INTO Affiliation 
    (AuthorID, InstitutionID, StartDate, EndDate)
    VALUES
    (author_id, new_institution_id, effective_date, NULL);
END;
$$ LANGUAGE plpgsql;

-- 1. Maintain Article History (SCD2)
CREATE OR REPLACE FUNCTION maintain_article_history()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        -- Close old version
        UPDATE Article_history
        SET ValidTo = CURRENT_DATE
        WHERE ArticleID = NEW.ArticleID
          AND ValidTo = '9999-12-31';

        -- Insert new version
        INSERT INTO Article_history
        (ArticleID, ValidFrom, ValidTo)
        VALUES
        (NEW.ArticleID, CURRENT_DATE, '9999-12-31');
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_article_update
BEFORE UPDATE OF Title, Abstract, DOI ON Article
FOR EACH ROW
EXECUTE FUNCTION maintain_article_history();

-- 2. Prevent Author Deletion with Active Affiliations
CREATE OR REPLACE FUNCTION prevent_author_deletion()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM Affiliation
        WHERE AuthorID = OLD.AuthorID
          AND EndDate IS NULL
    ) THEN
        RAISE EXCEPTION 'Cannot delete author with active affiliations';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_prevent_author_delete
BEFORE DELETE ON Author
FOR EACH ROW
EXECUTE FUNCTION prevent_author_deletion();

-- 3. Validate Journal Before Article Insertion
CREATE OR REPLACE FUNCTION validate_journal()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Journal
        WHERE JournalID = NEW.JournalID
    ) THEN
        RAISE EXCEPTION 'Invalid JournalID: %', NEW.JournalID;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validate_journal
BEFORE INSERT OR UPDATE ON Article
FOR EACH ROW
EXECUTE FUNCTION validate_journal();
