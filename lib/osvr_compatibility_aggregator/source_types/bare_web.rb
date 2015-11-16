

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers to a single URL's contents
    module BareWeb
      class BareWebSource
        def initialize(url, args = {})
          @info = args
          @info[:url] = url
        end

        def all
          unless @info[:data]
            require 'open-uri'
            remote_file = open(@info[:url])
            @info[:data] = remote_file.read
          end
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
