

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers recursively to all files in a repo with the .json extension.
    module GitHubDir
      class GitHubDirSource
        attr_accessor :repo
        attr_accessor :dir
        def initialize(args)
          @repo = args[:repo]
          @dir = args[:dir]
        end

        def each
          throw "not yet implemented!"
        end
      end

      # Create a source for a single web page.
      def github_dir(args)
        add GitHubDirSource.new(args)
      end
    end
  end
end
