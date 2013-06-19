$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rubualizations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rubualizations"
  s.version     = Rubualizations::VERSION
  s.authors     = ["John Bower"]
  s.email       = ["john@zode64.com"]
  s.homepage    = "http://www.zode64.com"
  s.summary     = "Gem that creates a google visualization data source from hashes passed to it."
  s.description = "Gem that creates a google visualization data source from hashes passed to it."

  s.files = Dir["lib/**/*", "MIT-LICENSE", "README.rdoc", "Rakefile"]
  s.test_files = Dir["test/**/*"]
end
