require 'oj'
require 'json/minify'

module OsvrCompatibilityAggregator
  def self.parse(source)
    if source.instance_of? String
      data_string = source
    else
      data_string = source[:data]
    end
    Oj.load(JSON.minify(data_string))
  end
end

require 'osvr_compatibility_aggregator/version'
require 'osvr_compatibility_aggregator/device_descriptors'
require 'osvr_compatibility_aggregator/display_descriptors'
