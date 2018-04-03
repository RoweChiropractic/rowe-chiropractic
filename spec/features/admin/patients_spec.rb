RSpec.feature 'As an admin user' do
  let(:patient) { patients(:barney) }
  let(:first_name) { FFaker::Name.first_name }
  let(:last_name) { FFaker::Name.last_name }
  let(:condition_1) { conditions(:laziness) }
  let(:condition_2) { conditions(:drunkenness) }

  before do
    login
    visit admin_dashboard_path
  end

  scenario 'I can see a list of patients' do
    click_on 'Patients'
    within "#patient_#{patient.id}" do
      expect(page).to have_content patient.first_name
      expect(page).to have_content patient.last_name
      expect(page).to have_content patient.conditions.map(&:name).to_sentence
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
    check condition_1.name
    check condition_2.name
    click_on 'Create Patient'
    expect(page).to have_content "Patient was successfully created."
    expect(page).to have_content "First Name #{first_name}"
    expect(page).to have_content "Last Name #{last_name}"
    expect(page).to have_content [condition_1, condition_2].map(&:name).to_sentence
  end
end
