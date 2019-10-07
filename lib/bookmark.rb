class Bookmark

  def self.all
    [
      "https://www.google.com",
      "https://www.facebook.com",
      "https://www.bbc.co.uk"
    ]
  end

  attr_reader :url
  def initialize(url)
    @url = url
  end
end
