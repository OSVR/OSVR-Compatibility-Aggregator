require 'osvr_compatibility_aggregator/lazy_remote_json'

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers to a single URL's contents
    module BareWeb
      class BareWebSource
        def initialize(url, args = {})
          info = args
          info[:url] = url
          @info = LazyRemoteJson.new info
        end

        def each
          yield @info
        end
      end

      # Create a source for a single web page.
      def bare_web(url, args = {})
        add BareWebSource.new(url, args)
      end
    end
  end
end
