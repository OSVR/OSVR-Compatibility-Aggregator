require 'osvr_compatibility_aggregator/parse'
require 'osvr_compatibility_aggregator/connection'

module OsvrCompatibilityAggregator
  # Class wrapping a hash containing a lazily-retrieved, lazily-parsed remote JSON file.
  class LazyRemoteJson
    # Expects an options hash with :raw_url or :url defined.
    def initialize(args)
      @info = args
    end

    # Lazy URL retriever
    def data
      unless @info[:data]
        require 'open-uri'

        url = @info[:raw_url]
        url ||= @info[:url]
        throw "No :url or :raw_url key in the LazyRemoteJson!" unless url
        response = Connection.get url
        throw "Error reading #{url} : #{response.status.to_s}" unless response.success?
        @info[:data] = response.body
      end
      @info[:data]
    end

    # Lazy JSON parser
    def json
      @info[:json] ||= OsvrCompatibilityAggregator.parse(data)
    end

    # Fall back to the hash
    def method_missing(m, *args, &block)
      @info[m]
    end

    def merge(h)
      LazyRemoteJson.new(@info.merge(h))
    end

    def merge!(h)
      @info.merge! h
    end

    def to_hash
      data
      json
      @info
    end
  end
end
