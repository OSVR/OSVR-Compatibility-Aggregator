

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers recursively to all files in a repo with the .json extension.
    class GitHubDir
      attribute_accessor :repo
      attribute_accessor :dir
      def initialize(args)
        @repo = args[:repo]
        @dir = args[:dir]
      end

      def all
        require 'open-uri'
        file = open(@URL)
        yield URL: @URL, data: file.read
      end
    end

    # Create a source for a single web page.
    def github_dir(args)
      GitHubDir.new url
    end
  end
end
