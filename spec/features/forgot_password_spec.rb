RSpec.feature 'As a registered user' do
  let(:user) { users(:admin) }
  let(:mail) { ActionMailer::Base.deliveries.last }

  before do
    clear_emails
  end

  scenario 'I can reset my password' do
    visit new_user_password_path
    fill_in 'Email', with: user.email
    click_on 'Reset Password'
    expect(mail['from'].value).to eq "Rowe Chiropractic <#{Rails.application.credentials.from_email}>"
  end
end
