class Fumblr < Padrino::Application
  configure do
    register SassInitializer

    ##
    # Application-specific configuration options
    #
    # set :raise_errors, true     # Show exceptions (default for development)
    # set :public                 # Location for static assets (default root/public)
    # set :reload, false          # Reload application files (default in development)
    # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, "bar"     # Set path for I18n translations (default your_app/locales)
    # enable  :sessions           # Disabled by default
    # disable :flash              # Disables rack-flash (enabled by default if sessions)
    # disable :padrino_helpers    # Disables padrino markup helpers (enabled by default if present)
    # disable :padrino_mailer     # Disables padrino mailer (enabled by default if present)
    # enable  :authentication     # Enable padrino-admin authentication (disabled by default)
    # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    
    Compass.configuration do |config|
      config.project_path = Padrino.root
      config.sass_dir = "public/stylesheets"
      config.project_type = :stand_alone
      config.http_path = "/"
      config.css_dir = "public/css"
      config.images_dir = "images"
      config.output_style = :compressed
      config.cache = false
    end
     
    Sass::Plugin.options.merge!(Compass.sass_engine_options)
  end
  

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #

end