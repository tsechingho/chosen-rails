# -*- encoding: utf-8 -*-
require File.expand_path('../lib/chosen-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Tse-Ching Ho']
  gem.email         = ['tsechingho@gmail.com']
  gem.description   = %q{Chosen is a javascript library of select box enhancer for jQuery and Protoype. This gem integrates Chosen with Rails asset pipeline for easy of use.}
  gem.summary       = %q{Integrate Chosen javascript library with Rails asset pipeline}
  gem.homepage      = 'https://github.com/tsechingho/chosen-rails'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'chosen-rails'
  gem.require_paths = ['lib']
  gem.version       = Chosen::Rails::VERSION

  gem.add_dependency 'railties', '>= 3.0'
  gem.add_dependency 'coffee-rails', '>= 3.2'
  gem.add_dependency 'sass-rails', '>= 3.2'
  gem.add_dependency 'compass-rails', '>= 1.1.2'

  gem.add_development_dependency 'bundler', '>= 1.0'
  gem.add_development_dependency 'rails', '>= 3.0'
  gem.add_development_dependency 'thor', '>= 0.14'
end
