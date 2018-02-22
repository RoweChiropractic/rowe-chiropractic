def login(user, account = nil)
  account ||= user.accounts.first
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: PasswordHelper.default_password
  click_button I18n.t('auth.sign_in')

  return unless user.accounts.count > 1
  within 'table.accounts' do
    click_on account.name
  end
end
