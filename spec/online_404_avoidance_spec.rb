require 'osvr_compatibility_aggregator/connection'
require 'osvr_compatibility_aggregator/device_descriptors'
require 'osvr_compatibility_aggregator/display_descriptors'

describe OsvrCompatibilityAggregator::Connection, '#head' do
  it 'errors if the URL is 404' do
    expect { OsvrCompatibilityAggregator::Connection.head 'http://osvr.org/nonexistentfile.txt' }.to raise_error(Faraday::ResourceNotFound)
  end
end

describe OsvrCompatibilityAggregator, '#device_descriptors' do
  it 'has no url fields that error' do
    OsvrCompatibilityAggregator.device_descriptors.each do |dev|
      next unless dev.url
      expect { OsvrCompatibilityAggregator::Connection.head dev.url }.not_to raise_error, "Trying to load dev.url=#{dev.url.to_s}"
    end
  end

  it 'has no raw_url fields that error' do
    OsvrCompatibilityAggregator.device_descriptors.each do |dev|
      next unless dev.raw_url
      expect { OsvrCompatibilityAggregator::Connection.head dev.raw_url }.not_to raise_error, "Trying to load dev.raw_url=#{dev.raw_url.to_s}"
    end
  end

  it 'has no sample_config fields that error' do
    OsvrCompatibilityAggregator.device_descriptors.each do |dev|
      next unless dev.sample_config
      expect { OsvrCompatibilityAggregator::Connection.head dev.sample_config }.not_to raise_error, "Trying to load dev.sample_config=#{dev.sample_config.to_s}"
    end
  end
end
