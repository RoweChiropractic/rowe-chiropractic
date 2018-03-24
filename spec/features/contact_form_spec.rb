RSpec.feature 'As a visitor' do
  let(:email) { FFaker::Internet.email }
  let(:first_name) { FFaker::Name.first_name }
  let(:last_name) { FFaker::Name.last_name }
  let(:contact_us_page) { CmsPage.create! title: 'Contact Us' }

  before do
    clear_emails
  end

  scenario 'I can use the contact form' do
    visit cms_page_path(contact_us_page)
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    click_on 'Submit'
    expect(page).to have_content I18n.t('contact_form.no_preferred_contact_method')
    fill_in 'Email', with: email
    select 'Morning', from: 'Preferred contact time'
    select 'Morning', from: 'Preferred appointment time'
    select 'Email', from: 'Preferred contact method'
    click_on 'Submit'
    expect(page).to have_content I18n.t('contact_form.success')
    open_email(ENV.fetch('contact_form_email'))
    expect(current_email.body).not_to be_nil
  end
end
