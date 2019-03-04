
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "redoctor/version"

Gem::Specification.new do |spec|
  spec.name          = "redoctor"
  spec.version       = Redoctor::VERSION
  spec.authors       = ["grezar"]
  spec.email         = ["grezar.dev@gmail.com"]

  spec.summary       = %q{Test HTTP redirect}
  spec.homepage      = "https://github.com/grezar/redoctor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
