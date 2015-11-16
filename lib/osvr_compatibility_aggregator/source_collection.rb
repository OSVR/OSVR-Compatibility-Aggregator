module OsvrCompatibilityAggregator
  # A collection that transparently iterates through elements that may include sub-elements.
  class SourceCollection
    attr_accessor :elements
    def initialize(&block)
      @elements = []
      yield self
      self
    end

    def add(elt)
      @elements << elt
    end

    def each
      @elements.each do |source|
        source.all do |e|
          yield e
        end
      end
    end
  end
end
