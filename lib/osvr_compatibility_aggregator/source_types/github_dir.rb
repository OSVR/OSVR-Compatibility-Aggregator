require 'octokit'
require 'faraday-http-cache'
require 'osvr_compatibility_aggregator/lazy_remote_json'

# Enable caching for GitHub API
stack = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end
Octokit.middleware = stack

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers recursively to all files in a repo with the .json extension.
    module GitHubDir
      class GitHubDirSource
        include Enumerable
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
            yield LazyRemoteJson.new(@info.merge url: f['html_url'], raw_url: f['download_url'])
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
