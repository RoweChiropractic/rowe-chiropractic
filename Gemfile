source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'actionview-encoded_mail_to', '~> 1.0'
gem 'active_link_to', '~> 1.0'
gem 'activeadmin'
gem 'activeadmin_blaze_theme'
gem 'aws-sdk-s3', require: false
gem 'bootstrap', '~> 4.1.1'
gem 'bootstrap4-kaminari-views'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'commonmarker'
gem 'devise'
gem 'figaro'
gem 'fog-aws'
gem 'friendly_id'
gem 'haml-rails'
gem 'invisible_captcha'
gem 'kaminari'
gem 'mini_magick'
gem 'newrelic_rpm', '~> 3.14'
gem 'paper_trail'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.2.0.rc2'
gem 'rails-html-sanitizer', '~> 1.0.4'
gem 'ransack', '~> 1.8.7'
gem 'redcarpet'
gem 'rollbar'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'ffaker'
  gem 'fuubar'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'rubocop', '0.50.0', require: false
  gem 'rubocop-rspec', '0.18.0', require: false
  gem 'selenium-webdriver', '~> 2.5'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
