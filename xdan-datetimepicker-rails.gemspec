# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xdan-datetimepicker-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "xdan-datetimepicker-rails"
  gem.version       = XdanDatetimepickerRails::VERSION
  gem.authors       = ["Joshua Kovach"]
  gem.email         = ["kovach.jc@gmail.com"]
  gem.summary       = %q{XDan's jQuery DateTimePicker packaged for the Rails Asset Pipeline}
  gem.description   = gem.description
  gem.homepage      = "https://www.github.com/shekibobo/xdan-datetimepicker-rails"
  gem.license       = "MIT"

  gem.files = Dir['{app,lib,vendor}/**/*'] + %w[Rakefile README.md LICENSE.txt]
  gem.require_paths = ["lib"]

  gem.add_dependency 'rails', '>= 3.2.16'
  gem.add_dependency 'jquery-rails'

  gem.add_development_dependency "bundler", "~> 1.5"
  gem.add_development_dependency "rake"
end
