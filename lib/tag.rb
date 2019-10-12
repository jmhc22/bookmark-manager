class Tag

  def self.create(tag_text:, bookmark_id:)
    result = DatabaseConnection.query("INSERT INTO tags (text) VALUES('#{tag_text}') RETURNING id, text;").first
    DatabaseConnection.query("INSERT INTO tags_bms (tag_id, bookmark_id) VALUES('#{result['id']}', '#{bookmark_id}');")
    Tag.new(id: result['id'], text: result['text'])
  end

  def self.where(bookmark_id:)
    tag_ids = DatabaseConnection.query("SELECT * FROM tags_bms WHERE bookmark_id = '#{bookmark_id}';")
    p tag_ids.map { |tag|
      result = DatabaseConnection.query("SELECT * FROM tags WHERE id = '#{tag['tag_id']}';").first
      Tag.new(id: result['id'], text: result['text'])
    }
  end

  attr_reader :id, :text
  def initialize(id:, text:)
    @id = id
    @text = text
  end
end
