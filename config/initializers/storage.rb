if Rails.env.development? or Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

else
  CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["aws_access_id"],
        aws_secret_access_key: ENV["aws_access_secret_key"],
        region: 'us-east-1'
    }
    config.storage = :fog
    config.fog_directory  = "mallorca-planner"
    config.fog_public     = false
  end
end
