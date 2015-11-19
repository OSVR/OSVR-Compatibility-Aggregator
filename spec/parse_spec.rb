require 'osvr_compatibility_aggregator'

describe OsvrCompatibilityAggregator, '#parse' do
  it 'parses some simple JSON from a "source"' do
    expect(OsvrCompatibilityAggregator.parse(data: %q(
    {
      "basicJson": true
    }))).to be_truthy
  end
  it 'parses some simple JSON from a string' do
    expect(OsvrCompatibilityAggregator.parse(%q(
    {
      "basicJson": true
    }))).to be_truthy
  end
  it 'parses some JSON with C-style comments from a string' do
    expect(OsvrCompatibilityAggregator.parse(%q(
    {
      "commentsCStyle": true /* block comment*/
    }))).to be_truthy
  end
  it 'parses some JSON with C++-style comments from a string' do
    expect(OsvrCompatibilityAggregator.parse(%q(
    {
      "commentsCxxStyle": true // single-line comment
    }))).to be_truthy
  end
end
