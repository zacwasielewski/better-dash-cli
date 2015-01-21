# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_dash_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "better_dash_cli"
  spec.version       = BetterDashCli::VERSION
  spec.authors       = ["Zac Wasielewski"]
  spec.email         = ["zac@wasielewski.org"]
  spec.summary       = %q{Better command line access to Dash documentation from the Mac OS X terminal}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/zacwasielewski/better-dash-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = ["dash"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
