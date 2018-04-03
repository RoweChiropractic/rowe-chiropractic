RSpec.feature 'As an admin user' do
  let(:patient) { patients(:milhouse) }
  let(:first_name) { FFaker::Name.first_name }
  let(:last_name) { FFaker::Name.last_name }

  before do
    login
    visit admin_dashboard_path
  end

  scenario 'I can see a list of patients' do
    click_on 'Patients'
    within "#patient_#{patient.id}" do
      expect(page).to have_content patient.first_name
      expect(page).to have_content patient.last_name
    end
  end

  scenario 'I can manage Patients' do
    visit admin_patients_path
    click_on 'New Patient'
    click_on 'Create Patient'
    expect(page).to have_content "First name* can't be blank"
    expect(page).to have_content "Last name* can't be blank"
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    click_on 'Create Patient'
    expect(page).to have_content "Patient was successfully created."
    expect(page).to have_content "First Name #{first_name}"
    expect(page).to have_content "Last Name #{last_name}"
    click_on 'Patients'
    expect(page).to have_content ''
  end
end
