# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_account_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_account_utils"
  spec.version       = AwsAccountUtils::VERSION
  spec.authors       = ["keviny22"]
  spec.email         = ["kevin_young@intuit.com"]

  spec.summary       = %q{A set of helper methods for configuring apects of AWS that do not have an API.}
  spec.description   = %q{A set of helper methods for configuring apects of AWS that do not have an API.}
  spec.homepage      = "https://github.com/intuit/aws_account_utils"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'rake', '~> 10.3.2'
  spec.add_runtime_dependency 'watir-webdriver', '~> 0.8.0'

end
