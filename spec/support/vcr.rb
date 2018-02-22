VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<GOOGLE_CLOUD_KEY>') { ENV.fetch('GOOGLE_CLOUD_KEY') }
end
