# encoding: utf-8
require 'rake'
require 'rake/sprocketstask'
require_relative './sprockets_manifest' # avoid including digests in file names - try without to see what happens

require_relative './sprockets_app'

task :default => :assets

PUBLIC_PATH = './public'

# This sprockets task provides the assets task.
Rake::SprocketsTask.new do |t|
  Sprockets::Sass.options[:style] = :compressed
  environment = SprocketsApp.new
  t.environment = environment
  t.output      = PUBLIC_PATH
  t.assets      = environment.each_logical_path.to_a.select { |a| a.match(/(^[^_\/]|\/[^_])[^\/]*$/) }
end