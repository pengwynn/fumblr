require 'sinatra'
require 'sinatra/config_file'
require 'thimblr/parser'

config_file 'config/fumblr.yml'

set :public_folder, File.join( File.dirname(__FILE__), settings.themes_path, settings.theme, "public" )

before do
  @parser = Thimblr::Parser.new(File.join(settings.data_path, settings.tumblr_username + '.yml'), File.join(settings.themes_path, settings.theme, 'theme.html'))
end

get '/' do
  @parser.render_posts
end

get '/page/:page' do
  @parser.render_posts(params[:page].to_i)
end

