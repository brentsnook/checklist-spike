require 'sprockets'
require 'sprockets-sass'
require 'sass'
require 'coffee-script'

class SprocketsApp < Sprockets::Environment
  def initialize
    super
    append_path 'app/assets/javascripts'
    append_path 'app/assets/stylesheets'
    append_path 'app/assets/images'
    append_path 'app/assets/html'

    register_engine '.haml', Tilt::HamlTemplate
  end
end