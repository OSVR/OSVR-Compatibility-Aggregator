require 'osvr_compatibility_aggregator'

describe OsvrCompatibilityAggregator, '#parse' do
  it 'parses some simple JSON from a "source"' do
    expect(OsvrCompatibilityAggregator.parse(data: %q(
    {
      "basicJson": true
    })))
  end
  it 'parses some simple JSON from a string' do
    expect(OsvrCompatibilityAggregator.parse(%q(
    {
      "basicJson": true
    })))
  end
  it 'parses some JSON with C-style comments from a string' do
    expect(OsvrCompatibilityAggregator.parse(%q(
    {
      "commentsCStyle": true /* block comment*/
    })))
  end
  it 'parses some JSON with C++-style comments from a string' do
    expect(OsvrCompatibilityAggregator.parse(%q(
    {
      "commentsCxxStyle": true // single-line comment
    })))
  end
end
