require 'osvr_compatibility_aggregator/connection'
describe OsvrCompatibilityAggregator::Connection, '#head' do
  it 'errors if the URL is 404' do
    expect { OsvrCompatibilityAggregator::Connection.head 'http://osvr.org/nonexistentfile.txt' }.to raise_error(Faraday::ResourceNotFound)
  end
end
