# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamodb-rails/paperclip/version'

Gem::Specification.new do |spec|
  spec.name          = "dynamodb-rails-paperclip"
  spec.version       = Dynamo::Paperclip::VERSION
  spec.authors       = ["Stefan Neculai"]
  spec.email         = ["stefan.neculai@gmail.com"]
  spec.description   = 'Dynamo::Paperclip enables you to use Paperclip with the DynamoDB Rails.'
  spec.summary       = 'Dynamo::Paperclip enables you to use Paperclip with the DynamoDB Rails.'
  spec.homepage      = "https://github.com/stefanneculai/dynamodb-rails-paperclip"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'paperclip', '~> 3.0'
end
