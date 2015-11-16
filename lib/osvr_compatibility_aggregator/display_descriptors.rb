require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.display_descriptors
    SourceCollection.new do |s|
      s.github_file repo: 'OSVR/OSVR-Core', file: 'apps/displays/OSVR_HDK_1_1.json'
    end
  end
end
