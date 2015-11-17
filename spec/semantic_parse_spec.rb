require 'osvr_compatibility_aggregator'
mini_device_desc = '{"deviceName": "bla", "semantic": {}}'
describe OsvrCompatibilityAggregator, '#semantic_tree' do
  it 'accepts an unparsed full device descriptor' do
    OsvrCompatibilityAggregator.semantic_tree mini_device_desc
  end
  it 'accepts a parsed full device descriptor' do
    OsvrCompatibilityAggregator.semantic_tree OsvrCompatibilityAggregator.parse(mini_device_desc)
  end
end
