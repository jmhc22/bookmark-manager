require 'bookmark'
require_relative 'setup_test_table'

describe Bookmark do
  let(:google) { described_class.new("http://www.google.com") }

  describe '.all' do
    it 'contains a list of bookmarks' do
      setup_test_database_table
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end
  end
end
