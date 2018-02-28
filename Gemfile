source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'actionview-encoded_mail_to', '~> 1.0'
gem 'active_link_to', '~> 1.0'
gem 'activeadmin'
gem 'bootstrap', '~> 4.0.0'
gem 'bootstrap4-kaminari-views'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'exception_handler'
gem 'haml-rails'
gem 'kaminari'
gem 'newrelic_rpm', '~> 3.14'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
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
