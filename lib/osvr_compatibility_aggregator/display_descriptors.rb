require 'osvr_compatibility_aggregator/source_types/bare_web'
require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.display_descriptors
    ret = SourceCollection.new
    ret.elements = [
      SourceTypes::bare_web('https://github.com/OSVR/OSVR-Core/blob/master/plugins/multiserver/com_osvr_Multiserver_OSVRHackerDevKit.json'),
      SourceTypes::bare_web('https://github.com/OSVR/OSVR-Core/blob/master/plugins/multiserver/com_osvr_Multiserver_RazerHydra.json'),
      SourceTypes::bare_web('https://github.com/OSVR/OSVR-Core/blob/master/plugins/multiserver/com_osvr_Multiserver_YEI_3Space_Sensor.json')
    ]
    ret
  end
end
