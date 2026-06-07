-- 1. Current Article Details with Authors
CREATE or replace VIEW CurrentArticleDetails AS
SELECT 
    a.ArticleID,
    a.Title,
    a.PublicationDate,
    j.Name AS JournalName,
    STRING_AGG(au.FirstName || ' ' || au.LastName, ', ') AS Authors,
    ah.ValidFrom AS CurrentVersionStart
FROM Article a
JOIN Article_history ah ON a.ArticleID = ah.ArticleID
    AND ah.ValidTo = '9999-12-31'
JOIN Journal j ON a.JournalID = j.JournalID
JOIN ArticleAuthor aa ON a.ArticleID = aa.ArticleID
JOIN Author au ON aa.AuthorID = au.AuthorID
GROUP BY a.ArticleID, a.Title, a.PublicationDate, j.Name, ah.ValidFrom;

-- 2. Author Affiliations Timeline
CREATE VIEW AuthorAffiliations AS
SELECT
    a.AuthorID,
    a.FirstName || ' ' || a.LastName AS AuthorName,
    i.Name AS Institution,
    af.StartDate,
    COALESCE(af.EndDate::TEXT, 'Current') AS Status,
    CASE 
        WHEN af.EndDate IS NULL 
        THEN EXTRACT(YEAR FROM AGE(NOW(), af.StartDate)) 
        ELSE EXTRACT(YEAR FROM AGE(af.EndDate, af.StartDate))
    END AS YearsAffiliated
FROM Author a
JOIN Affiliation af ON a.AuthorID = af.AuthorID
JOIN Institution i ON af.InstitutionID = i.InstitutionID;

-- 3. Keyword Usage Statistics
CREATE VIEW KeywordUsageStatistics AS
WITH KeywordCounts AS (
    SELECT
        k.KeywordID,
        k.Term,
        COUNT(ak.ArticleID) AS UsageCount,
        RANK() OVER (ORDER BY COUNT(ak.ArticleID) DESC) AS PopularityRank
    FROM Keyword k
    LEFT JOIN ArticleKeyword ak ON k.KeywordID = ak.KeywordID
    GROUP BY k.KeywordID, k.Term
)
SELECT 
    kc.Term,
    kc.UsageCount,
    kc.PopularityRank,
    ROUND((kc.UsageCount * 100.0) / SUM(kc.UsageCount) OVER (), 2) AS UsagePercentage
FROM KeywordCounts kc;

-- Temporal query optimization for article history
CREATE INDEX idx_article_temporal_range ON Article_history
USING BRIN (ValidFrom, ValidTo)
WHERE ValidTo = '9999-12-31';

CREATE INDEX idx_current_affiliations 
ON Affiliation(AuthorID, InstitutionID)
WHERE EndDate IS NULL;

CREATE INDEX idx_current_articles ON Article_history(ArticleID, ValidTo);
CREATE INDEX idx_author_names ON Author((FirstName || ' ' || LastName));
