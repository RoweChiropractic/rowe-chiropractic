# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

require 'capybara/rails'
require 'shoulda/matchers'
require 'support/auth_steps'
require 'support/capybara_webkit'
require 'support/devise'
require 'support/fixtures'
require 'support/helper_methods'
require 'support/js_drivers'
require 'support/password_helper'
require 'support/rspec_retry'
require 'support/shoulda_matchers'
require 'support/vcr'
Dir[Rails.root.join('spec/support/shared/examples/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/shared/context/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
