require 'oj'
require 'json/minify'

module OsvrCompatibilityAggregator
  def self.parse(source)
    Oj.load(JSON.minify(source[:data]))
  end
end

require 'osvr_compatibility_aggregator/version'
require 'osvr_compatibility_aggregator/device_descriptors'
require 'osvr_compatibility_aggregator/display_descriptors'
