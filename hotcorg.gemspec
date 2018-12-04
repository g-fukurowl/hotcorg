
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hotcorg/version"

Gem::Specification.new do |spec|
  spec.name          = "hotcorg"
  spec.version       = Hotcorg::VERSION
  spec.authors       = ["="]
  spec.email         = ["gfukurowl@gmail.com"]

  spec.summary       = %q{Hotcorg works as the watchdog for changing of cpu temperture.}
  spec.description   = %q{Hotcorg watches cpu temperture. You can direct thretholds. If cpu temperture gets over them, Hotdog notifies to you.}
  spec.homepage      = "https://github.com/g-fukurowl/hotcorg"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = ['hotcorg']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "iStats"
  spec.add_dependency "timers"
end
