feature 'Index' do
  scenario 'Index pages welcomes user' do
    visit '/'
    expect(page).to have_content("Bookmark Manager")
  end
end
