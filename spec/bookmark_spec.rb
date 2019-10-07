require 'bookmark'
describe Bookmark do

  let(:google) { described_class.new("https://www.google.com") }

  it "has a URL" do
    expect(google.url).to eq "https://www.google.com"
  end

end
