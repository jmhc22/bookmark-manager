require 'pg'
require_relative '../lib/database_connection'

def setup_test_database_table
  Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
  Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DAS")
  Bookmark.create(url: "http://www.google.com", title: "Google")
end

def persisted_data(id:, table:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';").first
end
