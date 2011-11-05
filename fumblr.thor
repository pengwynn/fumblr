require 'thimblr/importer'

class Fumblr < Thor

  desc "import <username>", "Import data from tumblr"
  def import(username)
    data = Thimblr::Import.username(username)
    File.open(File.join("data", username + ".yml"), "w") do |f|
      f.puts data
    end
  end
end
