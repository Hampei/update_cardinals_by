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

  s.files = Dir["{lib}/**/*.rb", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.required_ruby_version = '>= 2.1'
  s.add_dependency "activerecord", "> 5.0", "< 6.2"

  s.add_development_dependency "pg"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'dotenv', '~> 2.0'
  s.add_development_dependency 'database_cleaner', '~> 1.0'
  s.add_development_dependency 'appraisal'
end
