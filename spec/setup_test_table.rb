require 'pg'

def setup_test_database_table
  Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
  Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DAS")
  Bookmark.create(url: "http://www.google.com", title: "Google")
end
