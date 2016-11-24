$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "update_cardinals_by/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "update_cardinals_by"
  s.version     = UpdateCardinalsBy::VERSION
  s.authors     = ["Hampei"]
  s.email       = ["henk.van.der.veen@gmail.com"]
  s.homepage    = "https://github.com/hampei/update_cardinals_by"
  s.summary     = "postgres database extension to increment/decrement values safely and get back result."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activerecord", "~> 4.2.7"

  s.add_development_dependency "pg"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'database_cleaner'
end
