desc "Imports a blog from Tumblr for better previews"
task :import do
  username = shell.ask("What is your Tumblr username?")
  data_path = Padrino.root("public/#{username}.yml")
  begin
    if not File.exists?(data_path) or shell.yes?("File exists, overwrite?")
      data_file = Import.username(username)
      open(File.join(data_path),'w') do |f|
        f.write data_file
      end
    end
  rescue Exception => e
    shell.say e.message
  end
end