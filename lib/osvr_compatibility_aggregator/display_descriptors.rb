require 'osvr_compatibility_aggregator/source_types/bare_web'
require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.display_descriptors
    ret = SourceCollection.new
    ret.elements = [
      SourceTypes.bare_web('https://raw.githubusercontent.com/OSVR/OSVR-Core/master/apps/displays/OSVR_HDK_1_1.json')
    ]
    ret
  end
end
