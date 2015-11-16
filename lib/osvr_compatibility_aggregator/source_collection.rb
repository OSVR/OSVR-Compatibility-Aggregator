
require 'osvr_compatibility_aggregator/source_types/bare_web'
require 'osvr_compatibility_aggregator/source_types/github_dir'
require 'osvr_compatibility_aggregator/source_types/github_file'

module OsvrCompatibilityAggregator
  # A collection that transparently iterates through elements that may include sub-elements.
  class SourceCollection
    attr_accessor :elements
    def initialize(args = {})
      @info = args
      @elements = []
      yield self
      self
    end

    def add(elt)
      @elements << elt
    end

    def each
      @elements.each do |source|
        source.each do |e|
          yield @info.merge(e)
        end
      end
    end

    # Create a nested collection that has some default shared values
    def collection(args = {})
      new_col = SourceCollection.new(args) do |s|
        yield s
      end
      add new_col
    end
  end

  SourceCollection.include SourceTypes::BareWeb
  SourceCollection.include SourceTypes::GitHubDir
  SourceCollection.include SourceTypes::GitHubFile
end
