feature 'Hello World' do
  scenario 'Index pages welcomes world' do
    visit '/'
    expect(page).to have_content("Hello, World")
  end
end
