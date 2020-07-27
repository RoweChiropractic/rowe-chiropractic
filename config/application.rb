require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RoweChiropractic
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = 'Eastern Time (US & Canada)'
    config.autoload_paths += %W[#{config.root}/lib #{config.root}/app/services]
    config.i18n.default_locale = :en
    config.generators do |g|
      g.test_framework :rspec, views: false
      g.helper false
      g.assets false
      g.helper_specs false
      g.view_specs false
      g.orm :active_record, primary_key_type: :uuid
    end
    config.active_job.queue_adapter = :sidekiq
    config.action_mailer.default_options = {
      from: Rails.application.credentials.from_email
    }
  end
end
