RSpec.feature 'As an admin user' do
  let(:user) { users(:admin) }
  let(:inquiry) { inquiries(:inquiry_1) }

  before do
    login_as user
  end

  scenario 'I can review Inquiries' do
    visit admin_inquiry_path(inquiry)
    expect(page).to have_content inquiry.full_name
    expect(page).to have_content inquiry.email
    expect(page).to have_content inquiry.phone
    expect(page).to have_content inquiry.preferred_contact_method
    expect(page).to have_content inquiry.preferred_contact_time
    expect(page).to have_content inquiry.preferred_appointment_time
  end
end
