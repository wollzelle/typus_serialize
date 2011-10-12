# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "typus_serialize/version"

Gem::Specification.new do |s|
  s.name        = "typus_serialize"
  s.version     = TypusSerialize::VERSION
  s.authors     = ["William Meleyal", "Thomas Koenig", "I.C. Wiener"]
  s.email       = "team@wollzelle.com"
  s.homepage    = "http://wollzelle.com"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "typus_serialize"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "typus"
  s.add_runtime_dependency "jquery-rails"
  s.add_runtime_dependency "rails-backbone"
  s.add_runtime_dependency "ejs", "~> 1.0.0"
end
