# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname( __FILE__ ), "lib/version.rb" )

Gem::Specification.new do |s|
  s.name        = 'pentecost'
  s.version     = '0.0.1'
  s.summary     = "Pentecost Commander!"
  s.description = ""
  s.authors     = ["Bryan Kroger"]
  s.email       = 'bryan.kroger@gmail.com'
  s.homepage    = ''

  s.add_dependency( "thor", ">= 0.18.1" )
  s.add_dependency( "highline", ">= 1.6.19" )
  s.add_dependency( "rest-client", ">= 1.6.7" )

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
