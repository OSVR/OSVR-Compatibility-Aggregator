require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.device_descriptors
    SourceCollection.new do |s|
      s.github_file repo: 'OSVR/OSVR-Core', file: 'plugins/multiserver/com_osvr_Multiserver_OSVRHackerDevKit.json'
      s.github_file repo: 'OSVR/OSVR-Core', file: 'plugins/multiserver/com_osvr_Multiserver_RazerHydra.json'
      s.github_file repo: 'OSVR/OSVR-Core', file: 'plugins/multiserver/com_osvr_Multiserver_YEI_3Space_Sensor.json'
    end
  end
end
