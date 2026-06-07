# Academic Publications Database

A relational database for managing academic publications, authors, journals, and research institutions. 
Designed for tracking scholarly articles with complete metadata and relationships.

## Schema Overview

### Core Tables
- **Article**: Research papers with titles, abstracts, DOIs, and journal relationships
- **Author**: Researcher details with ORCID integration
- **Journal**: Scientific periodicals with ISSN tracking
- **Institution**: Research organizations with geographical data
- **Keyword**: Subject tags for article classification

### Relationship Tables
- **ArticleAuthor**: Many-to-many author/article relationships
- **ArticleKeyword**: Article-to-keyword mappings
- **Affiliation**: Author institutional associations with temporal tracking
- **Article_history**: Version history of article metadata

## Entity-Relationship Diagram
```plaintext
Articles ┬─ belongs to ─► Journals
         ├─ written by ─► Authors (through ArticleAuthor)
         └─ tagged with ─► Keywords (through ArticleKeyword)

Authors ── affiliated with ─► Institutions (with date ranges)

Article_history ── tracks ─► Article versions
