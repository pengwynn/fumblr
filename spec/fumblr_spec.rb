require 'spec_helper'
require File.join(File.dirname(__FILE__), '..', 'fumblr.rb')


set :environment, :test
set :data_path, 'spec/fixtures/data'
set :tumblr_username, 'pengwynn'
set :themes_path, 'spec/fixtures/themes'
set :theme, 'redux'

describe 'Fumblr' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "renders data" do
    get '/'
    last_response.should be_ok
    last_response.body.should match /Wynn Netherland/
  end

  it "renders a theme" do
    get '/'
    last_response.should be_ok
    last_response.body.should match /Powered by Tumblr/
  end

end
