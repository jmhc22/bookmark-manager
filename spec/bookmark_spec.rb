require 'bookmark'
require_relative 'setup_test_table'

describe Bookmark do
  let(:google) { described_class.new("http://www.google.com") }

  describe '.all' do
    it 'contains a list of bookmarks' do
      setup_test_database_table
      bookmarks = Bookmark.all
      expect(bookmarks).to include(["http://www.google.com", "Google"])
      expect(bookmarks).to include(["http://www.makersacademy.com", "Makers"])
      expect(bookmarks).to include(["http://www.destroyallsoftware.com", "DAS"])
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first
      expect(bookmark['url']).to eq 'http://www.testbookmark.com'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end
  end
end
