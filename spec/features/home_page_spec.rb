RSpec.feature 'As a guest' do
  scenario 'I can visit the home page' do
    visit '/'
    expect(page).to have_content 'Rowe Chiropractic'
  end
end
