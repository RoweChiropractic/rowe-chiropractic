ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

require 'capybara/rails'
require 'capybara/email/rspec'
require 'shoulda/matchers'
require 'support/devise'
require 'support/fixtures'
require 'support/helper_methods'
require 'support/invisible_captcha'
require 'support/js_drivers'
require 'support/password_helper'
require 'support/rspec_retry'
require 'support/shoulda_matchers'
require 'support/sidekiq'
Dir[Rails.root.join('spec/support/shared/examples/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/shared/context/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
