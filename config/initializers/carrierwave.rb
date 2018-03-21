CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     Rails.application.credentials.aws_access_key_id,
    aws_secret_access_key: Rails.application.credentials.aws_secret_access_key,
    region:                'us-east-2',
  }
  config.fog_directory  = 'rowechiropractic.com'
end
