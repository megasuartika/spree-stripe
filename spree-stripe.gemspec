# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree/stripe/version'

Gem::Specification.new do |spec|
  spec.name          = "spree-stripe"
  spec.version       = Spree::Stripe::VERSION
  spec.authors       = ["Itsavirus"]
  spec.email         = ["hello@itsavirus.com"]
  spec.description   = "Plugs Stripe Payment Gateway into Spree Stores"
  spec.summary       = "Plugs Stripe Payment Gateway into Spree Stores"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "stripe", "~> 5.34.0"
  spec.add_runtime_dependency "spree_core", "~> 4.2.2"
end
