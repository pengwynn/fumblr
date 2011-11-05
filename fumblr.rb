require 'sinatra'
require 'sinatra/config_file'
require 'thimblr/parser'
require './lib/rack/local_assets'


set :theme_asset_host, nil

config_file 'config/fumblr.yml'

theme_config_path = File.join(File.dirname(__FILE__), settings.themes_path, settings.theme, "config.yml")
config_file theme_config_path if File.exists?(theme_config_path)

if settings.theme_asset_host?
  use Rack::LocalAssets, :asset_host => 'static.thechangelog.com'
end

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

