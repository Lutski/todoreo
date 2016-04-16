# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todoreo/version'

Gem::Specification.new do |spec|
  spec.name          = "todoreo"
  spec.version       = Todoreo::VERSION
  spec.authors       = ["LudvigSoerensen"]
  spec.email         = ["ludvigsoerensen@gmail.com"]

  spec.summary       = %q{This is a small todo application}
  spec.description   = %q{This is a small todo application}
  spec.homepage      = "https://github.com/Lutski/todoreo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.


  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files         = Dir['lib/**/*.rb']
  #spec.bindir        = "exe"
  spec.executables   = ["todoreo"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
