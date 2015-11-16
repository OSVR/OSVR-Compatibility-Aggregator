

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers to a single URL's contents
    class BareWeb
      attribute_accessor :URL
      def initialize(url)
        @URL = url
      end

      def all
        require 'open-uri'
        file = open(@URL)
        yield URL: @URL, data: file.read
      end
    end

    # Create a source for a single web page.
    def bare_web(url)
      BareWeb.new url
    end
  end
end
