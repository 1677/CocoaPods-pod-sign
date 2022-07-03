# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-pod-sign/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-pod-sign'
  spec.version       = CocoapodsPodSign::VERSION
  spec.authors       = ['wosicuanqi']
  spec.email         = ['1677746430@qq.com']
  spec.description   = %q{help you setup CocoaPods bundle indentifier and team.}
  spec.summary       = %q{help you setup CocoaPods bundle indentifier and team.}
  spec.homepage      = 'https://github.com/1677/CocoaPods-pod-sign'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
