require 'thimblr/importer'
require 'yaml'

class Fumblr < Thor
  include Thor::Actions

  desc "import <username>", "Import data from tumblr"
  def import(username = config['tumblr_username'])
    data = Thimblr::Import.username(username)
    File.open(File.join("data", username + ".yml"), "w") do |f|
      f.puts data
    end
  end

  desc "server", "Start Fumblr server"
  def server
    %x[shotgun]
  end

  desc "create_theme <name>", "Create a new Compass-powered theme"
  method_options :compass => :boolean, :sass => :boolean
  def create_theme(name, use_compass=false)
    theme_path = File.join(config['themes_path'], name)
    create_file File.join(theme_path, 'theme.html')
    empty_directory File.join(theme_path, 'public')

    if options.compass?
      compass_options = theme_path + " --css-dir public/css --sass-dir sass"
      compass_options += " -x sass" if options.sass?
      %x[compass create #{compass_options}]
    end
  end


  private

    def config
      YAML.load_file('config/fumblr.yml')
    end
end
