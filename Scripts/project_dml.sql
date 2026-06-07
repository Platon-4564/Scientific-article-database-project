------------------
-- Journal Data --
------------------
INSERT INTO Journal (Name, ISSN, Publisher) VALUES
('Journal of Advanced Computing', '1234-5678', 'Tech Publishing Inc'),
('Medical Science Review', '2345-6789', 'Health Press'),
('Environmental Research', '3456-7890', 'Eco Publications'),
('Quantum Physics Today', '4567-8901', 'Physics Media Group'),
('AI Innovations', '5678-9012', 'Future Tech Network'),
('Modern Robotics', '6789-0123', 'Automation Press'),
('Space Exploration Digest', '7890-1234', 'Astro Publications'),
('Biochemistry Trends', '8901-2345', 'BioScience Media'),
('Renewable Energy Review', '9012-3456', 'Green Energy Press'),
('Neuroscience Frontiers', '0123-4567', 'Brain Research Media'),
('Data Science Weekly', '1122-3344', 'Digital Analytics Corp'),
('Material Science Bulletin', '2233-4455', 'Chemistry World'),
('Oceanography Insights', '3344-5566', 'Marine Studies Press'),
('Cybersecurity Today', '4455-6677', 'Digital Security Network'),
('Genetic Engineering Review', '5566-7788', 'BioTech Publications');

-----------------------
-- Institution Data --
-----------------------
INSERT INTO Institution (Name, Address) VALUES
('MIT', '77 Massachusetts Ave, Cambridge, MA 02139'),
('Stanford University', '450 Serra Mall, Stanford, CA 94305'),
('Max Planck Institute', 'Hofgartenstraße 8, 80539 Munich, Germany'),
('University of Tokyo', '7 Chome-3-1 Hongo, Bunkyo City, Tokyo 113-8654'),
('ETH Zurich', 'Rämistrasse 101, 8092 Zürich, Switzerland'),
('California Institute of Technology', '1200 E California Blvd, Pasadena, CA 91125'),
('National University of Singapore', '21 Lower Kent Ridge Rd, Singapore 119077'),
('University of Cambridge', 'The Old Schools, Trinity Ln, Cambridge CB2 1TN, UK'),
('Tsukuba Research Center', '1-1-1 Tennodai, Tsukuba, Ibaraki 305-8577, Japan'),
('CERN', 'Esplanade des Particules 1, 1211 Meyrin, Switzerland'),
('Indian Institute of Science', 'CV Raman Rd, Bengaluru, Karnataka 560012, India'),
('KAIST', '291 Daehak-ro, Yuseong-gu, Daejeon, South Korea'),
('Harvard University', 'Massachusetts Hall, Cambridge, MA 02138'),
('University of Oxford', 'Wellington Square, Oxford OX1 2JD, UK'),
('CSIRO', 'Clunies Ross St, Acton ACT 2601, Australia');

--------------------
-- Author Data --
--------------------
INSERT INTO Author (FirstName, LastName, ORCID, Email) VALUES
('John', 'Smith', '0000-0001-2345-6789', 'john.smith@mit.edu'),
('Maria', 'Garcia', '0000-0002-3456-7890', 'maria.garcia@stanford.edu'),
('Chen', 'Wei', '0000-0003-4567-8901', 'chen.wei@tokyo.ac.jp'),
('Olivier', 'Dubois', '0000-0004-5678-9012', 'olivier.dubois@ethz.ch'),
('Amina', 'Abdullah', '0000-0005-6789-0123', 'a.abdullah@nus.edu.sg'),
('Rajesh', 'Kumar', '0000-0006-7890-1234', 'rajesh.kumar@iisc.ac.in'),
('Emma', 'Wilson', '0000-0007-8901-2345', 'emma.wilson@caltech.edu'),
('Hiroshi', 'Tanaka', '0000-0008-9012-3456', 'hiroshi.tanaka@tsukuba.ac.jp'),
('Sophie', 'Martin', '0000-0009-0123-4567', 'sophie.martin@cern.ch'),
('James', 'Brown', '0000-0010-1234-5678', 'james.brown@ox.ac.uk'),
('Yuna', 'Kim', '0000-0011-2345-6789', 'yuna.kim@kaist.ac.kr'),
('Luca', 'Rossi', '0000-0012-3456-7890', 'luca.rossi@cambridge.ac.uk'),
('Anika', 'Patel', '0000-0013-4567-8901', 'anika.patel@harvard.edu'),
('Mohamed', 'Ali', '0000-0014-5678-9012', 'mohamed.ali@mpg.de'),
('Grace', 'Thompson', '0000-0015-6789-0123', 'grace.thompson@csiro.au');

--------------------
-- Keyword Data --
--------------------
INSERT INTO Keyword (Term) VALUES
('Machine Learning'),
('Climate Change'),
('Quantum Computing'),
('CRISPR'),
('Neuroscience'),
('Renewable Energy'),
('Robotics'),
('Artificial Intelligence'),
('Nanotechnology'),
('Astrophysics'),
('Cybersecurity'),
('Genetic Engineering'),
('Biochemistry'),
('Data Analytics'),
('Material Science');

---------------------
-- Article Data --
---------------------
INSERT INTO Article (Title, Abstract, PublicationDate, DOI, JournalID) VALUES
('Deep Learning in Medical Imaging', 'Advancements in AI-assisted diagnostics...', '2023-01-15', '10.1234/dlmi', 1),
('Ocean Acidification Trends', 'Long-term study of pH changes...', '2023-02-20', '10.2345/ocean', 3),
('Quantum Algorithm Optimization', 'New approaches to quantum computing...', '2023-03-10', '10.3456/quant', 4),
('CRISPR Gene Editing Ethics', 'Ethical considerations in gene therapy...', '2023-04-05', '10.4567/crispr', 8),
('Solar Cell Efficiency Breakthrough', 'Perovskite-based solar cells achieve...', '2023-05-12', '10.5678/solar', 9),
('Autonomous Drone Navigation', 'AI-powered collision avoidance systems...', '2023-06-18', '10.6789/drones', 6),
('Dark Matter Detection Methods', 'New techniques in astrophysics...', '2023-07-22', '10.7890/darkm', 7),
('Neuroplasticity in Adults', 'Brain adaptation mechanisms study...', '2023-08-30', '10.8901/neuro', 10),
('Blockchain Security Protocols', 'Advanced cryptographic methods...', '2023-09-05', '10.9012/block', 14),
('Graphene Production Techniques', 'Scalable manufacturing processes...', '2023-10-11', '10.0123/graphene', 12),
('mRNA Vaccine Stability', 'Improvements in vaccine preservation...', '2023-11-15', '10.1122/mrna', 2),
('Quantum Encryption Networks', 'Secure communication systems...', '2023-12-01', '10.2233/qencrypt', 5),
('AI Ethics Framework', 'Governance models for AI...', '2024-01-09', '10.3344/aiethics', 5),
('Deep Sea Exploration Tech', 'New submersible designs...', '2024-02-14', '10.4455/deepsea', 13),
('Battery Recycling Methods', 'Sustainable Li-ion processing...', '2024-03-20', '10.5566/battery', 9);

-------------------------
-- ArticleAuthor Data --
-------------------------
INSERT INTO ArticleAuthor (ArticleID, AuthorID) VALUES
(1,1), (1,2),
(2,3), (2,4),
(3,5), 
(4,6), (4,7),
(5,8),
(6,9), (6,10),
(7,11),
(8,12), (8,13),
(9,14),
(10,15), (10,1),
(11,2), (11,3),
(12,4), 
(13,5), (13,6),
(14,7), 
(15,8), (15,9);

---------------------------
-- ArticleKeyword Data --
---------------------------
INSERT INTO ArticleKeyword (ArticleID, KeywordID) VALUES
(1,1), (1,8),
(2,2), 
(3,3), (3,8),
(4,4), 
(5,6),
(6,7), (6,8),
(7,10),
(8,5),
(9,11), 
(10,9), (10,14),
(11,4), (11,13),
(12,3), (12,11),
(13,8), 
(14,2), (14,14),
(15,6), (15,14);

-------------------------
-- Affiliation Data --
-------------------------
INSERT INTO Affiliation (AuthorID, InstitutionID, StartDate, EndDate) VALUES
(1,1,'2015-01-01',NULL),
(2,2,'2018-06-01','2022-12-31'), (2,3,'2023-01-01',NULL),
(3,4,'2019-04-01',NULL),
(4,5,'2016-09-01',NULL),
(5,7,'2020-03-15','2023-08-31'), (5,6,'2023-09-01',NULL),
(6,11,'2017-11-01',NULL),
(7,6,'2019-02-01',NULL),
(8,9,'2018-07-01','2021-06-30'), (8,4,'2021-07-01',NULL),
(9,10,'2020-01-15',NULL),
(10,14,'2015-09-01',NULL),
(11,12,'2019-08-01',NULL),
(12,8,'2016-04-01','2020-03-31'), (12,2,'2020-04-01',NULL),
(13,13,'2017-03-01',NULL),
(14,3,'2018-10-01',NULL),
(15,15,'2019-09-01',NULL);

---------------------------
-- Article_history Data --
---------------------------
INSERT INTO Article_history (ArticleID, ValidFrom, ValidTo) VALUES
(1,'2023-01-01','2023-01-14'), (1,'2023-01-15','9999-12-31'),
(2,'2023-02-01','2023-02-19'), (2,'2023-02-20','9999-12-31'),
(3,'2023-03-01','2023-03-09'), (3,'2023-03-10','9999-12-31'),
(4,'2023-04-01','2023-04-04'), (4,'2023-04-05','9999-12-31'),
(5,'2023-05-01','2023-05-11'), (5,'2023-05-12','9999-12-31'),
(6,'2023-06-01','2023-06-17'), (6,'2023-06-18','9999-12-31'),
(7,'2023-07-01','2023-07-21'), (7,'2023-07-22','9999-12-31'),
(8,'2023-08-01','2023-08-29'), (8,'2023-08-30','9999-12-31');

-- ArticleAuthor (Article ⇄ Author relationships)
INSERT INTO ArticleAuthor (ArticleID, AuthorID) VALUES
(1, 1), (1, 2),   -- AI Ethics: John Smith + Maria Garcia
(2, 3),           -- CRISPR: Chen Wei
(3, 4), (3, 5),   -- Quantum: Olivier + Amina
(4, 6),           -- Solar: Rajesh
(5, 7), (5, 8),   -- Drones: Emma + Hiroshi
(6, 9),           -- Dark Matter: Sophie
(7, 10),          -- Neuroplasticity: James
(8, 11), (8, 12), -- Blockchain: Yuna + Luca
(9, 13),          -- Graphene: Anika
(10, 14),         -- mRNA: Mohamed
(11, 15), (11, 1),-- Quantum Enc: Grace + John
(12, 2),          -- AI Ethics: Maria
(13, 3),          -- Deep Sea: Chen
(14, 4), (14, 5); -- Battery: Olivier + Amina

-- ArticleKeyword (Article ⇄ Keyword mappings)
INSERT INTO ArticleKeyword (ArticleID, KeywordID) VALUES
(1, 8), (1, 15),   -- AI Ethics: AI + Ethics
(2, 4),            -- CRISPR: Genetic Eng
(3, 3), (3, 8),    -- Quantum: QC + AI
(4, 6),            -- Solar: Renewable
(5, 7), (5, 8),    -- Drones: Robotics + AI
(6, 10),           -- Dark Matter: Astrophysics
(7, 5),            -- Neuroplasticity: Neuroscience
(8, 11), (8, 14),  -- Blockchain: Cyber + Data
(9, 9),            -- Graphene: Nano
(10, 12),          -- mRNA: Bio
(11, 3), (11, 11), -- Quantum Enc: QC + Cyber
(12, 8),           -- AI Ethics: AI
(13, 2),           -- Deep Sea: Climate
(14, 6), (14, 14); -- Battery: Energy + Data

-- Affiliation (Author ⇄ Institution relationships)
INSERT INTO Affiliation (AuthorID, InstitutionID, StartDate, EndDate) VALUES
(1, 1, '2015-01-01', NULL),          -- MIT (current)
(2, 2, '2018-06-01', '2022-12-31'),  -- Stanford (past)
(3, 4, '2019-04-01', NULL),          -- Tokyo (current)
(4, 5, '2016-09-01', NULL),          -- ETH Zurich
(5, 7, '2020-03-15', '2023-08-31'),  -- NUS (past)
(6, 11, '2017-11-01', NULL),         -- Indian Inst
(7, 6, '2019-02-01', NULL),          -- Caltech
(8, 9, '2021-07-01', NULL),          -- Tsukuba
(9, 10, '2020-01-15', NULL),         -- CERN
(10, 14, '2015-09-01', NULL),        -- Oxford
(11, 12, '2019-08-01', NULL),        -- KAIST
(12, 8, '2020-04-01', NULL),         -- Cambridge
(13, 13, '2017-03-01', NULL),        -- Harvard
(14, 3, '2018-10-01', '2021-09-30'), -- Max Planck (past)
(15, 15, '2019-09-01', NULL)        -- CSIRO

---------------------------
-- Article_history Data --
---------------------------
INSERT INTO Article_history (ArticleID, ValidFrom, ValidTo) VALUES
-- Article 1: Deep Learning in Medical Imaging
(1, '2023-01-01', '2023-01-14'),  -- Draft period
(1, '2023-01-15', '9999-12-31'),  -- Published version

-- Article 2: Ocean Acidification Trends
(2, '2023-02-01', '2023-02-19'),  -- Review period
(2, '2023-02-20', '9999-12-31'),  -- Final publication

-- Article 3: Quantum Algorithm Optimization
(3, '2023-03-01', '2023-03-09'),  -- Peer review
(3, '2023-03-10', '9999-12-31'),   -- Accepted version

-- Article 4: CRISPR Gene Editing Ethics
(4, '2023-04-01', '2023-04-04'),  -- Ethical review
(4, '2023-04-05', '9999-12-31'),   -- Approved version

-- Article 5: Solar Cell Efficiency Breakthrough
(5, '2023-05-01', '2023-05-11'),  -- Technical revisions
(5, '2023-05-12', '9999-12-31'),   -- Published article

-- Article 6: Autonomous Drone Navigation
(6, '2023-06-01', '2023-06-17'),  -- Safety review
(6, '2023-06-18', '9999-12-31'),   -- Certified version

-- Article 7: Dark Matter Detection Methods
(7, '2023-07-01', '2023-07-21'),  -- Data validation
(7, '2023-07-22', '9999-12-31'),   -- Peer-approved

-- Article 8: Neuroplasticity in Adults (single version)
(8, '2023-08-30', '9999-12-31')   -- Direct publication