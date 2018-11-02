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

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "devise", "~> 4.5.0"
  s.add_dependency "pagy", "~> 0.21.0"
  s.add_dependency "pundit", "~> 2.0.0"

  s.add_development_dependency "sqlite3"
end
