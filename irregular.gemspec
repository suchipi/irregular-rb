# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'irregular/version'

Gem::Specification.new do |spec|
  spec.name          = "irregular"
  spec.version       = Irregular::VERSION
  spec.authors       = ["Stephen Scott"]
  spec.email         = ["me@suchipi.com"]
  spec.summary       = "Abstracted, human-readable regular expressions"
  spec.description   = "Module providing a method to compile regular expressions from templates."
  spec.homepage      = "http://github.com/suchipi/irregular-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
end
