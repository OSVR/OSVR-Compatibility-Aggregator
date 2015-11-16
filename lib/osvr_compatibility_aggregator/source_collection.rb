module OsvrCompatibilityAggregator
  # A collection that transparently iterates through elements that may include sub-elements.
  class SourceCollection
    attr_accessor :elements

    def each
      @elements.each do |source|
        source.all do |e|
          yield e
        end
      end
    end
  end
end
