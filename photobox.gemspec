# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'photobox/version'

Gem::Specification.new do |spec|
  spec.name          = "photobox"
  spec.version       = Photobox::VERSION
  spec.authors       = ["Devin Wadsworth"]
  spec.email         = ["devinwadsworth@gmail.com"]
  spec.summary       = "Simple Dropbox photo management."
  spec.description   = "Group photos into folders by month."
  spec.homepage      = "https://github.com/daymun/photobox"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rainbow", "~> 2.0"
  spec.add_runtime_dependency "thor", "~> 0.19"
end
