-- 1. Basic WHERE + ORDER BY
SELECT title, publicationdate 
FROM article 
WHERE journalid = 3 
ORDER BY publicationdate DESC 
LIMIT 3;

-- 2. INNER JOIN + GROUP BY + HAVING
SELECT j.name, COUNT(a.articleid) AS article_count
FROM journal j
JOIN article a ON j.journalid = a.journalid
GROUP BY j.name
HAVING COUNT(a.articleid) > 1;

-- 3. LEFT JOIN + IS NULL
SELECT a.firstname, a.lastname
FROM author a
LEFT JOIN articleauthor aa ON a.authorid = aa.authorid
WHERE aa.articleid IS NULL;

-- 4. RIGHT JOIN + SUBQUERY
SELECT i.name, COUNT(af.authorid) AS researchers
FROM affiliation af
RIGHT JOIN institution i ON af.institutionid = i.institutionid
WHERE i.institutionid IN (SELECT institutionid FROM institution WHERE address LIKE '%Switzerland%')
GROUP BY i.name;

-- 5. FULL OUTER JOIN + COALESCE
SELECT COALESCE(a.firstname, 'No author') AS author, 
       COALESCE(k.term, 'No keyword') AS keyword
FROM author a
FULL OUTER JOIN articlekeyword ak ON a.authorid = ak.articleid
FULL OUTER JOIN keyword k ON ak.keywordid = k.keywordid;

-- 6. CROSS JOIN (Cartesian product)
SELECT j.name AS journal, k.term AS keyword
FROM journal j
CROSS JOIN keyword k
LIMIT 5;

-- 7. SELF JOIN
SELECT a1.title AS article1, a2.title AS article2
FROM article a1
JOIN article a2 ON a1.journalid = a2.journalid AND a1.articleid < a2.articleid;

-- 8. WINDOW FUNCTION (ROW_NUMBER)
SELECT title, publicationdate,
       ROW_NUMBER() OVER (PARTITION BY journalid ORDER BY publicationdate DESC) AS journal_rank
FROM article;

-- 9. WINDOW FUNCTION (RANK)
SELECT authorid, COUNT(*) AS article_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS author_rank
FROM articleauthor
GROUP BY authorid;

-- 10. WINDOW FUNCTION (DENSE_RANK)
SELECT term, COUNT(*) AS usage_count,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS keyword_rank
FROM articlekeyword ak
JOIN keyword k ON ak.keywordid = k.keywordid
GROUP BY term;

-- 11. WINDOW FUNCTION (NTILE)
SELECT title, publicationdate,
       NTILE(4) OVER (ORDER BY publicationdate) AS publication_quarter
FROM article;

-- 12. EXISTS + CORRELATED SUBQUERY
SELECT a.firstname, a.lastname
FROM author a
WHERE EXISTS (
    SELECT 1 FROM affiliation af 
    WHERE af.authorid = a.authorid 
    AND af.enddate IS NULL
);

-- 13. ALL + SUBQUERY
SELECT title, publicationdate
FROM article
WHERE publicationdate > ALL (
    SELECT publicationdate 
    FROM article 
    WHERE journalid = 5
);

-- 14. ANY + SUBQUERY
SELECT name FROM journal
WHERE journalid = ANY (
    SELECT journalid 
    FROM article 
    WHERE publicationdate BETWEEN '2023-07-01' AND '2023-12-31'
);

-- 15. IN + SUBQUERY
SELECT term FROM keyword
WHERE keywordid IN (
    SELECT keywordid 
    FROM articlekeyword 
    WHERE articleid = 5
);

-- 16. LAG WINDOW FUNCTION
SELECT title, publicationdate,
       LAG(title, 1) OVER (ORDER BY publicationdate) AS previous_article
FROM article;

-- 17. CTE + WINDOW FUNCTION
WITH journal_stats AS (
    SELECT journalid, 
           COUNT(*) AS total_articles,
           AVG(LENGTH(abstract)) AS avg_abstract_length
    FROM article
    GROUP BY journalid
)
SELECT *, RANK() OVER (ORDER BY avg_abstract_length DESC) AS abstract_rank
FROM journal_stats;

-- 18. PAGINATION (LIMIT/OFFSET)
SELECT title, publicationdate
FROM article
ORDER BY publicationdate
LIMIT 5 OFFSET 10;

-- 19. FILTER + WINDOW FUNCTION
SELECT authorid,
       COUNT(*) FILTER (WHERE EXTRACT(YEAR FROM startdate) = 2020) AS affiliations_2020,
       COUNT(*) FILTER (WHERE EXTRACT(YEAR FROM startdate) = 2021) AS affiliations_2021
FROM affiliation
GROUP BY authorid;

-- 20. ADVANCED WINDOW FRAME
SELECT title, publicationdate,
       COUNT(*) OVER (ORDER BY publicationdate 
                      ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_count
FROM article;