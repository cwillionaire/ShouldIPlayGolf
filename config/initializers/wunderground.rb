require 'wunderground'

Wunderground.configure do |config|
  config.api_key = ENV['WUNDERGROUND_API_KEY']
end
