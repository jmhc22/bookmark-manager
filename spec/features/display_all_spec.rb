feature 'Display all bookmarks' do
  scenario 'displays all saved bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('https://www.google.com')
    expect(page).to have_content('https://www.facebook.com')
    expect(page).to have_content('https://www.bbc.co.uk')
  end
end
