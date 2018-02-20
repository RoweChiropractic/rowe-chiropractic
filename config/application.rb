require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RoweChiropractic
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

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
  end
end
