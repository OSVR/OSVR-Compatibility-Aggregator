require 'osvr_compatibility_aggregator/parse'

module OsvrCompatibilityAggregator
  def self.semantic_tree(source)
    if source.instance_of? String
      data = parse(source)
    else
      data = source
    end
  end
end
