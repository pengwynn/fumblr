require 'thimblr/importer'
require 'yaml'

class Fumblr < Thor

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


  private

    def config
      YAML.load_file('config/fumblr.yml')
    end
end
