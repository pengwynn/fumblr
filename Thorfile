require 'thimblr/importer'

class Fumblr < Thor

  desc "import <username>", "Import data from tumblr"
  def import(username)
    data = Thimblr::Import.username(username)
    File.open(File.join("data", username + ".yml"), "w") do |f|
      f.puts data
    end
  end

  desc "server <username> <theme>", "Start Fumblr server"
  def server(username='demo', theme='101')
    %x[shotgun]
  end
end
