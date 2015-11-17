require 'octokit'


module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers recursively to all files in a repo with the .json extension.
    module GitHubDir
      class GitHubDirSource
        def initialize(args)
          @info = args
          @repo = args[:repo]
          @dir = args[:dir]
        end

        def each
          require 'open-uri'
          contents = Octokit.contents @repo, path: @dir
          contents.each do |f|
            next unless f['name'].end_with? '.json'
            remote_file = open(f['download_url'])
            data = remote_file.read
            yield @info.merge url: f['html_url'], raw_url: f['download_url'], data: data
          end
        end
      end

      # Create a source for a single web page.
      def github_dir(args)
        add GitHubDirSource.new(args)
      end
    end
  end
end
