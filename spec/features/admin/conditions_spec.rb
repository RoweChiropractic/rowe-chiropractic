RSpec.feature 'As an admin user' do
  let(:condition) { conditions(:drunkenness) }
  let(:name) { FFaker::Lorem.word }
  let(:description) { FFaker::Lorem.paragraph }

  before do
    login
    visit admin_dashboard_path
  end

  scenario 'I can see a list of patients' do
    click_on 'Conditions'
    within "#condition_#{condition.id}" do
      expect(page).to have_content condition.name
      expect(page).to have_content condition.description
    end
  end

  scenario 'I can manage Patients' do
    visit admin_conditions_path
    click_on 'New Condition'
    click_on 'Create Condition'
    expect(page).to have_content "Name* can't be blank"
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_on 'Create Condition'
    expect(page).to have_content "Condition was successfully created."
    expect(page).to have_content "Name #{name}"
    expect(page).to have_content "Description #{description}"
  end
end
