RSpec.feature 'As a guest' do
  scenario 'I can visit the home page' do
    visit '/'
    expect(page).to have_content 'Rowe Chiropractic'
  end

  scenario 'I can visit marketing url "/betterlife"' do
    visit '/betterlife'
    expect(page).to have_content 'Rowe Chiropractic'
  end

    scenario 'I can visit marketing url "fullerlife"' do
    visit '/fullerlife'
    expect(page).to have_content 'Rowe Chiropractic'
  end


end
