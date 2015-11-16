require 'osvr_compatibility_aggregator/source_types/bare_web'
require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.display_descriptors
    SourceCollection.new do |s|
      s.add SourceTypes.bare_web('https://raw.githubusercontent.com/OSVR/OSVR-Core/master/apps/displays/OSVR_HDK_1_1.json')
    end
  end
end
