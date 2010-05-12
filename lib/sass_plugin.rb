# Enables support for SASS template reloading in rack applications.
# See http://nex-3.com/posts/88-sass-supports-rack for more details.
# Store SASS files (by default) within 'app/stylesheets'

module SassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'
    Sass::Plugin.options[:template_location] = Padrino.root("public/stylesheets")
    Sass::Plugin.options[:css_location] = Padrino.root("public/css")
    #Sass::Plugin.options[:cache_location] = Padrino.root("tmp/.sass-cache")
    Sass::Plugin.options[:style] = :compact
    Sass::Plugin.options[:syntax] = :sass

    app.use Sass::Plugin::Rack
  end
end
