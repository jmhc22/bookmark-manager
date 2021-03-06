class Comment

  def self.create(text:, bookmark_id:)
    result = DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES('#{text}', '#{bookmark_id}') RETURNING id, text, bookmark_id").first
    Comment.new(id: result['id'], text: result['text'], bookmark_id: result['bookmark_id'])
  end

  def self.delete(bookmark_id:)
    DatabaseConnection.query("DELETE FROM comments WHERE bookmark_id = #{bookmark_id}")
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT * FROM comments where bookmark_id = '#{bookmark_id}';")
    result.map { |comment|
      Comment.new(id: comment['id'], text: comment['text'], bookmark_id: comment['bookmark_id'])
    }
  end

  attr_reader :id, :text, :bookmark_id
  def initialize(id:, text:, bookmark_id:)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end
