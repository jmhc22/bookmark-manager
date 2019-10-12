require 'bookmark'
require_relative 'database_helpers'

describe Bookmark do
  let(:comment_class) { double(:comment_class) }
  let(:tag_class) { double(:tag_class) }
  let(:google) { described_class.new("http://www.google.com") }

  describe '.all' do
    it 'contains a list of bookmarks' do
      setup_test_database_table
      bookmarks = Bookmark.all.map { |bm| bm.title }
      expect(bookmarks).to include "Google"
      expect(bookmarks).to include "Makers"
      expect(bookmarks).to include "DAS"
    end

    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end

    it 'does not create a new bookmark if the URL is not valid' do
    Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
    expect(Bookmark.all.empty?).to eq true
  end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.update(id: bookmark.id, title: 'Snakers Academy', url: 'http://www.snakersacademy.com')
      updated_bookmark = Bookmark.all.first

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#comments' do
    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class: comment_class)
    end
  end

  describe '#tags' do
    it 'calls .where on the tag class' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(tag_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.tags(tag_class: tag_class)
    end
  end
end
