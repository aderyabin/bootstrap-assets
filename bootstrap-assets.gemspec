# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootstrap-assets/version"

Gem::Specification.new do |s|
  s.name        = "bootstrap-assets"
  s.platform    = Gem::Platform::RUBY
  s.version     = BootstrapAssets::VERSION
  s.authors     = ["Andrey Deryabin"]
  s.email       = ["deriabin@gmail.com"]
  s.homepage    = "http://github.com/aderyabin/bootstrap-assets"
  s.summary     = %q{Twitter Bootstrap toolkit for Rails 3.1 Asset Pipeline}
  s.description = %q{Twitter Bootstrap toolkit for Rails 3.1 Asset Pipeline}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency "less-rails", "~> 2.2.0"
end
