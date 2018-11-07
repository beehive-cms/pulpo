$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "beehive/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "beehive"
  s.version     = Beehive::VERSION
  s.authors     = ["mbajur"]
  s.email       = ["mbajur@gmail.com"]
  s.homepage    = "https://github.com/otwarteklatki/beehive"
  s.summary     = "Extendable CMS"
  s.description = "Extendable CMS for Ruby on Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "5.2.1"
  s.add_dependency "devise", "4.5.0"
  s.add_dependency "pagy", "0.21.0"
  s.add_dependency "pundit", "2.0.0"
  s.add_dependency "jsonapi-resources", "0.9.3"
  s.add_dependency "ransack", "2.1.0"
  s.add_dependency "loaf", "0.8.0"
  s.add_dependency "draper", "3.0.1"
  s.add_dependency "deface", "1.3.2"

  s.add_development_dependency "sqlite3"
end
