require 'pg'

def setup_test_database_table
  Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
  Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DAS")
  Bookmark.create(url: "http://www.google.com", title: "Google")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
