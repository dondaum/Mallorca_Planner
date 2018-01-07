# Supported options: :resque, :sidekiq, :delayed_job
#Devise::Async.backend = :sidekiq
#Devise::Async.queue = :default
Devise::Async.setup do |config|
  config.enabled = true
end
