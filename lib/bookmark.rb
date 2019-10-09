require 'pg'

class Bookmark

  def self.all
    connection = choose_connection
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    }
  end

  def self.create(url:, title:)
    connection = choose_connection

    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title").first
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  def self.delete(id:)
    connection = choose_connection
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    connection = choose_connection
    result = connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;").first
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  attr_reader :id, :title, :url
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  private

  def self.choose_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end


end
