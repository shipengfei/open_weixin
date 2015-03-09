# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_weixin/version'

Gem::Specification.new do |spec|
  spec.name          = "open_weixin"
  spec.version       = OpenWeixin::VERSION
  spec.authors       = ["Penfei Shi"]
  spec.email         = ["spfzzz@163.com"]
  spec.summary       = "summary"
  spec.description   = "descriptions"
  spec.homepage      = "https://github.com/shipengfei/open_weixin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").map { |e| e unless e.end_with? ".gem" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", "3.2.16"
end
