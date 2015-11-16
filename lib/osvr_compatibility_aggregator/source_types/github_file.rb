

module OsvrCompatibilityAggregator
  module SourceTypes
    # Refers to a single file in a repo.
    module GitHubFile
      class GitHubFileSource
        def initialize(args)
          repo = args[:repo]
          file = args[:file]
          @info = args
          @info[:branch] = 'master' unless @info[:branch]
          @info[:url] = "https://github.com/#{repo}/blob/#{@info[:branch]}/#{file}"
          @info[:raw_url] = "https://raw.githubusercontent.com/#{repo}/#{@info[:branch]}/#{file}"
        end

        def each
          unless @info[:data]
            require 'open-uri'
            remote_file = open(@info[:raw_url])
            @info[:data] = remote_file.read
          end
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
