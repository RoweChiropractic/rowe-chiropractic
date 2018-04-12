RSpec.feature 'As an admin user' do
  let(:patient) { patients(:barney) }
  let(:first_name) { FFaker::Name.first_name }
  let(:last_name) { FFaker::Name.last_name }
  let(:diagnosis) { FFaker::Lorem.paragraph }
  let(:specialty_1) { specialties(:laziness) }
  let(:specialty_2) { specialties(:drunkenness) }

  before do
    login
    visit admin_patients_path
  end

  scenario 'I can see a list of patients' do
    within "#patient_#{patient.id}" do
      expect(page).to have_content patient.first_name
      expect(page).to have_content patient.last_name
      expect(page).to have_content patient.specialties.map(&:title).sort.to_sentence
    end
  end

  scenario 'I can manage Patient details' do
    click_on 'New Patient'
    click_on 'Create Patient'
    expect(page).to have_content "First name* can't be blank"
    expect(page).to have_content "Last name* can't be blank"
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    fill_in 'Diagnosis', with: diagnosis
    check specialty_1.title
    check specialty_2.title
    click_on 'Create Patient'
    expect(page).to have_content "Patient was successfully created."
    expect(page).to have_content first_name
    expect(page).to have_content last_name
    expect(page).to have_content [specialty_1, specialty_2].map(&:title).sort.to_sentence
  end

  context 'with Testimonials' do
    let(:testimonial_title) { FFaker::CheesyLingo.title }
    let(:testimonial_body) { FFaker::CheesyLingo.paragraph }

    scenario 'I can manage Patient Testimonial', :js do
      click_on 'New Patient'
      fill_in_required_patient_data
      click_on 'Add New Testimonial'
      fill_in 'Title', with: testimonial_title
      fill_in 'Body', with: testimonial_body
      click_on 'Create Patient'
      expect(page).to have_content testimonial_title
      expect(page).to have_content testimonial_body
    end
  end

  context 'with X-Rays', :js do
    let(:xray_name) { FFaker::CheesyLingo.title }
    let(:xray_date) { '2001-01-01' }
    let(:xray_file) { 'spec/fixtures/xrays/xray.jpg' }
    let(:xray_description) { FFaker::CheesyLingo.paragraph }
    let(:xray_2_name) { FFaker::CheesyLingo.title }
    let(:xray_2_date) { '2002-02-02' }
    let(:xray_2_file) { 'spec/fixtures/xrays/xray-2.jpg' }
    let(:xray_2_description) { FFaker::CheesyLingo.paragraph }

    scenario 'I can manage Patient X-rays', :js do
      click_on 'New Patient'
      fill_in_required_patient_data
      click_on 'Add New X-Ray'
      within '.has_many_fields:first-of-type' do
        fill_in 'Name', with: xray_name
        fill_in 'Description', with: xray_description
        attach_file 'File', Rails.root.join(xray_file)
        fill_in 'Date', with: xray_date
      end
      click_on 'Add New X-Ray'
      within '.has_many_fields:nth-of-type(2)' do
        fill_in 'Name', with: xray_2_name
        fill_in 'Description', with: xray_2_description
        attach_file 'File', Rails.root.join(xray_2_file)
        fill_in 'Date', with: xray_2_date
      end
      click_on 'Create Patient'
      expect(page).to have_content xray_name
      expect(page).to have_content xray_description
      expect(page).to have_content I18n.l Time.parse(xray_date).to_date, format: :short_with_year
      expect(page).to have_css("img[src*='#{xray_file.split('/').last}']")
      expect(page).to have_content xray_2_name
      expect(page).to have_content xray_2_description
      expect(page).to have_content I18n.l Time.parse(xray_2_date).to_date, format: :short_with_year
      expect(page).to have_css("img[src*='#{xray_2_file.split('/').last}']")
    end
  end

  context 'with Posture Prints', :js do
    let(:posture_print_name) { FFaker::CheesyLingo.title }
    let(:posture_print_date) { '2001-01-01' }
    let(:posture_print_file) { 'spec/fixtures/posture_prints/posture_print.jpg' }
    let(:posture_print_description) { FFaker::CheesyLingo.paragraph }
    let(:posture_print_2_name) { FFaker::CheesyLingo.title }
    let(:posture_print_2_date) { '2002-02-02' }
    let(:posture_print_2_file) { 'spec/fixtures/posture_prints/posture_print-2.jpg' }
    let(:posture_print_2_description) { FFaker::CheesyLingo.paragraph }

    scenario 'I can manage Patient X-rays', :js do
      click_on 'New Patient'
      fill_in_required_patient_data
      click_on 'Add New X-Ray'
      within '.has_many_fields:first-of-type' do
        fill_in 'Name', with: posture_print_name
        fill_in 'Description', with: posture_print_description
        attach_file 'File', Rails.root.join(posture_print_file)
        fill_in 'Date', with: posture_print_date
      end
      click_on 'Add New X-Ray'
      within '.has_many_fields:nth-of-type(2)' do
        fill_in 'Name', with: posture_print_2_name
        fill_in 'Description', with: posture_print_2_description
        attach_file 'File', Rails.root.join(posture_print_2_file)
        fill_in 'Date', with: posture_print_2_date
      end
      click_on 'Create Patient'
      expect(page).to have_content posture_print_name
      expect(page).to have_content posture_print_description
      expect(page).to have_content I18n.l Time.parse(posture_print_date).to_date, format: :short_with_year
      expect(page).to have_css("img[src*='#{posture_print_file.split('/').last}']")
      expect(page).to have_content posture_print_2_name
      expect(page).to have_content posture_print_2_description
      expect(page).to have_content I18n.l Time.parse(posture_print_2_date).to_date, format: :short_with_year
      expect(page).to have_css("img[src*='#{posture_print_2_file.split('/').last}']")
    end
  end
end
