require 'tag'
require 'database_connection'
require 'bookmark'

describe Tag do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag = Tag.create(tag_text: 'test-tag', bookmark_id: bookmark.id)
      persisted_data = persisted_data(table: 'tags', id: tag.id )

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data['id']
      expect(tag.text).to eq 'test-tag'
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Tag.create(tag_text: 'test-tag', bookmark_id: bookmark.id)
      Tag.create(tag_text: 'test-tag2', bookmark_id: bookmark.id)

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first
      persisted_data = persisted_data(table: 'tags', id: tag.id)

      expect(tags.length).to eq 2
      expect(tag.id).to eq persisted_data['id']
      expect(tag.text).to eq 'test-tag'
    end
  end
end
