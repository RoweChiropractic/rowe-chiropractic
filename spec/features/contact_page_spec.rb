RSpec.feature 'As a visitor' do
  let(:email) { FFaker::Internet.email }
  let(:name) { FFaker::Name.name }
  let(:contact_us_page) { CmsPage.create! title: 'Contact Us' }

  before do
    clear_emails
  end

  scenario 'I can use the contact form' do
    visit cms_page_path(contact_us_page)
    fill_in 'Name...', with: name
    click_on 'Submit'
    expect(page).to have_content I18n.t('contact_form.no_preferred_contact_method')
    fill_in 'Email...', with: email
    click_on 'Submit'
    expect(page).to have_content I18n.t('contact_form.success')
    open_email Rails.application.credentials.from_email
    expect(current_email.body).not_to be_nil
  end
end
