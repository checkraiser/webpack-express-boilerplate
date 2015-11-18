if Rails.env == 'development'
  require 'rack-mini-profiler'

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
  Rack::MiniProfiler.config.disable_caching = false #
end
if Rails.env.production?
  uri = URI.parse(ENV["REDIS_URL"])
  Rack::MiniProfiler.config.storage_options = { :host => uri.host, :port => uri.port, :password => uri.password }
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
end
