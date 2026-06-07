-- Core Tables
CREATE TABLE if not exists Article (
  ArticleID SERIAL PRIMARY KEY,
  Title VARCHAR(500) NOT NULL,
  Abstract TEXT,
  PublicationDate DATE NOT NULL,
  DOI VARCHAR(255) UNIQUE NOT NULL,
  JournalID INT NOT NULL REFERENCES Journal(JournalID)
);

CREATE TABLE if not exists Author (
  AuthorID SERIAL PRIMARY KEY,
  FirstName VARCHAR(100) NOT NULL,
  LastName VARCHAR(100) NOT NULL,
  ORCID VARCHAR(20) UNIQUE,
  Email VARCHAR(255) NOT NULL
);

CREATE TABLE if not exists Journal (
  JournalID SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  ISSN CHAR(9) UNIQUE NOT NULL,
  Publisher VARCHAR(255) NOT NULL
);

CREATE TABLE if not exists Institution (
  InstitutionID SERIAL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Address TEXT NOT NULL
);

CREATE TABLE if not exists Keyword (
  KeywordID SERIAL PRIMARY KEY,
  Term VARCHAR(100) UNIQUE NOT NULL
);

-- Junction Tables
CREATE TABLE if not exists ArticleAuthor (
  ArticleID INT NOT NULL REFERENCES article(ArticleID),
  AuthorID INT NOT NULL REFERENCES author(AuthorID),
  PRIMARY KEY (ArticleID, AuthorID)
);

CREATE TABLE if not exists ArticleKeyword (
  ArticleID INT NOT NULL REFERENCES Article(ArticleID),
  KeywordID INT NOT NULL REFERENCES Keyword(KeywordID),
  PRIMARY KEY (ArticleID, KeywordID)
);

CREATE TABLE if not exists Affiliation (
  AuthorID INT NOT NULL REFERENCES Author(AuthorID),
  InstitutionID INT NOT NULL REFERENCES Institution(InstitutionID),
  StartDate DATE NOT NULL,
  EndDate DATE,
  PRIMARY KEY (AuthorID, InstitutionID)
);
create table if not exists Article_history (
	ArticleID INT NOT NULL REFERENCES Article(ArticleID),
	ValidFrom DATE not null,
	ValidTo DATE not null,
	primary key (ArticleID, ValidFrom, ValidTo)
)