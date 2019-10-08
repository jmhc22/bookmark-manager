require 'pg'

def setup_test_database_table
  Bookmark.create(url: "http://www.makersacademy.com")
  Bookmark.create(url: "http://www.destroyallsoftware.com")
  Bookmark.create(url: "http://www.google.com")
end
