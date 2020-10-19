Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0', size: 1, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0', size: 12, network_timeout: 5 }
end
