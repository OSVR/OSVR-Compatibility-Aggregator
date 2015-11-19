require 'osvr_compatibility_aggregator/parse'

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
        url = @info[:url] unless url
        remote_file = open(url)
        unless remote_file.status[0] == "200"
          throw "Error reading #{url} : #{remote_file.status.to_s}"
        end
        @info[:data] = remote_file.read
      end
      @info[:data]
    end

    # Lazy JSON parser
    def json
      @info[:json] = parse(data) unless @info[:json]
      @info[:json]
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
      @info.merge(data: data, json: json)
    end
  end
end
