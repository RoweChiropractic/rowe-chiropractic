Sidekiq.configure_server do |config|
  schedule_file = 'config/schedule.yml'

  config.redis = { url: ENV['REDISTOGO_URL'] }

  if File.exist?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISTOGO_URL'] }
end

if Rails.env.development?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end
