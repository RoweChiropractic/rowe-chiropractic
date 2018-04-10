RSpec.feature 'As an admin user' do
  let(:specialty) { specialties(:drunkenness) }
  let(:name) { FFaker::Lorem.word }
  let(:description) { FFaker::Lorem.paragraph }

  before do
    login
    visit admin_dashboard_path
  end

  scenario 'I can see a list of Specialties' do
    click_on 'Specialties'
    within "#specialty_#{specialty.id}" do
      expect(page).to have_content specialty.name
      expect(page).to have_content specialty.description
    end
  end

  scenario 'I can manage Specialty' do
    visit admin_specialties_path
    click_on 'New Specialty'
    click_on 'Create Specialty'
    expect(page).to have_content "Name* can't be blank"
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_on 'Create Specialty'
    expect(page).to have_content "Specialty was successfully created."
    expect(page).to have_content "Name #{name}"
    expect(page).to have_content "Description #{description}"
  end
end
