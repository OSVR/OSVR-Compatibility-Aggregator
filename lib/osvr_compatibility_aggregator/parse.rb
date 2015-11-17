module OsvrCompatibilityAggregator
  def self.parse(source)
    require 'oj'
    require 'json/minify'
    if source.instance_of? String
      data_string = source
    else
      data_string = source[:data]
    end
    Oj.load(JSON.minify(data_string))
  end
end
