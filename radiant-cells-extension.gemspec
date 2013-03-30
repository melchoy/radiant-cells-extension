# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-cells-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-cells-extension"
  s.version     = RadiantCellsExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantCellsExtension::AUTHORS
  s.email       = RadiantCellsExtension::EMAIL
  s.homepage    = RadiantCellsExtension::URL
  s.summary     = RadiantCellsExtension::SUMMARY
  s.description = RadiantCellsExtension::DESCRIPTION

  # Define gem dependencies here.
  # Don't include a dependency on radiant itself: it causes problems when radiant is in vendor/radiant.
  s.add_dependency 'cells', '3.3.9'
  # s.add_dependency "radiant-some-extension", "~> 1.0.0"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
end
