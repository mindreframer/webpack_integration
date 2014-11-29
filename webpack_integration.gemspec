# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webpack_integration/version'

Gem::Specification.new do |spec|
  spec.name          = "webpack_integration"
  spec.version       = WebpackIntegration::VERSION
  spec.authors       = ["Roman Heinrich"]
  spec.email         = ["roman.heinrich@gmail.com"]
  spec.summary       = %q{A small gem to integrated digested static files with Ruby / Rails apps}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/mindreframer/webpack_integration"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "maxitest"
  spec.add_development_dependency "mocha"
end
