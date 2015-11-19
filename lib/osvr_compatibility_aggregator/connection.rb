require 'faraday'
require 'faraday-http-cache'

module OsvrCompatibilityAggregator
  # Factored-out network layer
  module Connection
    # Default Faraday middleware stack/connection
    CONNECTION = Faraday::Connection.new do |builder|
      builder.use Faraday::Response::RaiseError
      builder.use Faraday::HttpCache
      #builder.use Faraday::FollowRedirects, limit: 3
      builder.adapter Faraday.default_adapter
    end
    def self.connection
      CONNECTION
    end
    def self.get(args)
      connection.get args
    end
    def self.head(args)
      connection.get args
    end
  end
end
