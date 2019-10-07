
# Bookmark Manager #
## User Stories ##
```
As a user,
So that I can access my favourite websites quickly,
I would like to see a list of all my bookmarks.

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

## Domain Model ##
```
Classes         Methods
BookmarkList    display_all
Bookmark
```

## Setting Up Database: ##
```
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
```
