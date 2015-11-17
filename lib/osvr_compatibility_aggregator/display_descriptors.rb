require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.display_descriptors
    SourceCollection.new do |s|
      s.github_dir repo: 'OSVR/OSVR-Core',
                   dir: 'apps/displays'
    end
  end
end
