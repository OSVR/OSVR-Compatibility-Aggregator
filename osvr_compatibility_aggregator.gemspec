# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'osvr_compatibility_aggregator/version'

Gem::Specification.new do |spec|
  spec.name          = 'osvr_compatibility_aggregator'
  spec.version       = OsvrCompatibilityAggregator::VERSION
  spec.authors       = ['Ryan Pavlik']
  spec.email         = ['ryan@sensics.com']

  spec.summary       = 'A gem for retrieving and interacting with OSVR JSON descriptors of all sorts, for a variety of purposes not limited to but including web page generation.'
  spec.homepage      = 'https://github.com/OSVR/OSVR-Compatibility-Aggregator'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_dependency 'octokit'
  spec.add_dependency 'oj'
  spec.add_dependency 'json-minify'
end
