require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.device_descriptors
    SourceCollection.new do |s|
      s.bare_web 'https://raw.githubusercontent.com/OSVR/OSVR-Core/blob/master/plugins/multiserver/com_osvr_Multiserver_OSVRHackerDevKit.json'
      s.bare_web 'https://raw.githubusercontent.com/OSVR/OSVR-Core/blob/master/plugins/multiserver/com_osvr_Multiserver_RazerHydra.json'
      s.bare_web 'https://raw.githubusercontent.com/OSVR/OSVR-Core/blob/master/plugins/multiserver/com_osvr_Multiserver_YEI_3Space_Sensor.json'
    end
  end
end
