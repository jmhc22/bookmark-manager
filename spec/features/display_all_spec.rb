feature 'Display all bookmarks' do
  scenario 'displays all saved bookmarks' do
    setup_test_database_table
    visit '/bookmarks'
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
