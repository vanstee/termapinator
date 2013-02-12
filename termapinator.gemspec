# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'termapinator/version'

Gem::Specification.new do |gem|
  gem.name          = "termapinator"
  gem.version       = Termapinator::VERSION
  gem.authors       = ["vanstee"]
  gem.email         = ["patrick@vanstee.me"]
  gem.description   = %q{Convert google maps to ascii for great fun! :zap: :boom: :heart:}
  gem.summary       = %q{Convert google maps to ascii for great fun!}
  gem.homepage      = "https://github.com/vanstee/termapinator"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'chunky_png'
  gem.add_dependency 'rainbow'

  gem.add_development_dependency 'rake'
end
