require 'osvr_compatibility_aggregator'
require 'oj'
require 'json/minify'

shared_examples 'JSON data collection' do |parameter|

    it 'returns a non-empty collection' do
      count = 0
      parameter.each do |a|
        count += 1
      end
      expect(count).to be > 0
    end

    it 'returns a collection with URL elements' do
      parameter.each do |a|
        expect(a.url).to be_truthy
      end
    end

    it 'returns a collection with data elements' do
      parameter.each do |a|
        expect(a.data).to be_truthy
      end
    end

    it 'returns a collection with JSON in its data' do
      parameter.each do |a|
        expect(Oj.load(JSON.minify(a.data))).to be_truthy
        expect(a.json).to be_truthy
      end
    end

    it 'returns a collection with JSON lazily-retrieved-and-parsed in its data' do
      parameter.each do |a|
        expect(a.json).to be_truthy
      end
    end
end

describe OsvrCompatibilityAggregator, '#display_descriptors' do
  it_behaves_like 'JSON data collection', OsvrCompatibilityAggregator.display_descriptors
end


describe OsvrCompatibilityAggregator, '#device_descriptors' do
  it_behaves_like 'JSON data collection', OsvrCompatibilityAggregator.device_descriptors
end
