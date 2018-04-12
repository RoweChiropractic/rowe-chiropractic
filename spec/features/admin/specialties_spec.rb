RSpec.feature 'As an admin user' do
  let(:specialty) { specialties(:drunkenness) }
  let(:title) { FFaker::Lorem.word }
  let(:teaser) { FFaker::Lorem.paragraph }
  let(:body) { FFaker::Lorem.paragraph }

  before do
    login
    visit admin_dashboard_path
  end

  scenario 'I can see a list of Specialties' do
    click_on 'Case Studies'
    click_on 'Specialties'
    within "#specialty_#{specialty.id}" do
      expect(page).to have_content specialty.title
      expect(page).to have_content specialty.body
    end
  end

  scenario 'I can manage Specialty' do
    visit admin_specialties_path
    click_on 'New Specialty'
    click_on 'Create Specialty'
    expect(page).to have_content "Title* can't be blank"
    expect(page).to have_content "Teaser* can't be blank"
    expect(page).to have_content "Body* can't be blank"
    fill_in 'Title', with: title
    fill_in 'Teaser', with: teaser
    fill_in 'Body', with: body
    click_on 'Create Specialty'
    expect(page).to have_content "Specialty was successfully created."
    expect(page).to have_content "Title #{title}"
    expect(page).to have_content "Teaser #{teaser}"
    expect(page).to have_content "Body #{body}"
  end
end
