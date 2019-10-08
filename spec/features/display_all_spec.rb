feature 'Display all bookmarks' do
  scenario 'displays all saved bookmarks' do
    setup_test_database_table
    visit '/bookmarks'
    expect(page).to have_content('Google')
    expect(page).to have_content('DAS')
    expect(page).to have_content('Makers')
  end

  scenario 'bookmarks are visible' do
    setup_test_database_table
    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('DAS',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    end
end
