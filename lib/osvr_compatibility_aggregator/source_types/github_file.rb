require 'osvr_compatibility_aggregator/lazy_remote_json'

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers to a single file in a repo.
    module GitHubFile
      class GitHubFileSource
        include Enumerable
        def initialize(args)
          repo = args[:repo]
          file = args[:file]
          info = args
          info[:branch] ||= 'master'
          info[:url] = "https://github.com/#{repo}/blob/#{info[:branch]}/#{file}"
          info[:raw_url] = "https://raw.githubusercontent.com/#{repo}/#{info[:branch]}/#{file}"

          # todo this really only will happen for device descriptors, is it in the wrong place?
          info[:sample_config] = "https://github.com/#{repo}/blob/#{info[:branch]}/#{info[:sample_config]}" if info[:sample_config]
          @info = LazyRemoteJson.new(info)
        end

        def each
          yield @info
        end
      end

      # Create a source for a single web page.
      def github_file(args)
        add GitHubFileSource.new(args)
      end
    end
  end
end
