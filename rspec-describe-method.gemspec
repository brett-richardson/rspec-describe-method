$LOAD_PATH.unshift File.expand_path( '../lib', __FILE__ )
require 'rspec/describe_method/version'


Gem::Specification.new do |s|
  s.name          = 'rspec-describe-method'
  s.summary       = 'Tersely describe methods on Ruby objects in your RSpecs'
  s.description   = 'Adds a #describe_method method for use within RSpecs, which set the test subject to the defined method'
  s.version       =  RSpec::DescribeMethod::VERSION
  s.date          = '2013-12-26'
  s.homepage      = 'http://brett-richardson.github.io/rspec-describe-method' # 'http://www.dablweb.com'
  s.authors       = [ 'Brett Richardson' ]
  s.email         = [ 'Brett.Richardson.NZ@gmail.com' ]
  s.require_path  = 'lib'
  s.files         = Dir.glob( 'lib/**/*' ) + %w{ Gemfile Guardfile MIT-LICENSE README.md }

  s.add_dependency 'rspec'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'growl'
end
