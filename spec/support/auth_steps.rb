def login
  user = users(:admin)
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: PasswordHelper.default_password
  click_button I18n.t('auth.sign_in')
end
