User.create!(first_name: 'Admin', last_name: 'User', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Condition.create! name: 'Drunkenness'
Condition.create! name: 'Sleepiness'
Condition.create! name: 'Boredom'

