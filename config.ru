require File.dirname(__FILE__) + '/sprockets_app'

map '/' do
  run SprocketsApp.new
end