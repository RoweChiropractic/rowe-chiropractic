if Rails.env.development?
  # User.create!(first_name: 'Admin', last_name: 'User', email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  Specialty.create! title: 'Drunkenness'
  Specialty.create! title: 'Sleepiness'
  Specialty.create! title: 'Boredom'
end
