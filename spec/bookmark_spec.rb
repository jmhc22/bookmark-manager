require 'bookmark'
describe Bookmark do

  let(:google) { described_class.new("http://www.google.com") }

  it "has a URL" do
    expect(google.url).to eq "http://www.google.com"
  end

  describe '.all' do
    it 'contains a list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

end
