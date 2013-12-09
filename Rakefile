require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |gem|
    gem.name = "hiera-confit"
    gem.version = "0.2.0"
    gem.summary = "Confit backend for Hiera"
    gem.email = "patrik@diabol.se"
    gem.author = "Patrik Boström"
    gem.homepage = "http://github.com/crayfishx/hiera-mysql"
    gem.description = "Hiera backend for retrieving configuration values from Confit"
    gem.require_path = "lib"
    gem.files = FileList["lib/**/*"].to_a
    gem.add_dependency('rest-client')
    gem.add_dependency('json')
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end
