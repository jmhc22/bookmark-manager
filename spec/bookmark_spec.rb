require 'bookmark'
describe Bookmark do

  let(:google) { described_class.new("https://www.google.com") }

  it "has a URL" do
    expect(google.url).to eq "https://www.google.com"
  end

  describe '.all' do
    it 'contains a list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://www.google.com")
      expect(bookmarks).to include("https://www.facebook.com")
      expect(bookmarks).to include("https://www.bbc.co.uk")
    end
  end

end
