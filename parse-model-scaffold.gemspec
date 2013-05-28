# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parse-model-scaffold/version'

Gem::Specification.new do |gem|
  gem.name          = "parse-model-scaffold"
  gem.version       = Parse::Model::Scaffold::VERSION
  gem.authors       = ["Matt Hupman"]
  gem.email         = ["mhupman@citrrus.com"]
  gem.description   = %q{Tool to generate concrete subclasses of existing Parse.com model objects in a variety of languages.}
  gem.summary       = %q{Can be included as a library or exectued as a binary.}
  gem.homepage      = "https://github.com/mhupman/parse-model-scaffold"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'httparty'
  gem.add_runtime_dependency 'slop'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
end
