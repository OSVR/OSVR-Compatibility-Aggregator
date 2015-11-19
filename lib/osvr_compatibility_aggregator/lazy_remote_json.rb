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
        if @info[:raw_url]
          url = @info[:raw_url]
        elsif @info[:url]
          url = @info[:url]
        else
          throw "No :url or :raw_url key in the LazyRemoteJson!"
        end
        remote_file = open(url)
        throw "Error reading #{url} : #{remote_file.status.to_s}" unless remote_file.status[0] == '200'
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
      data
      json
      @info
    end
  end
end
