if Rails.env.development?
  User.create!(first_name: 'Admin', last_name: 'User', email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  Specialty.create! name: 'Drunkenness'
  Specialty.create! name: 'Sleepiness'
  Specialty.create! name: 'Boredom'
end
