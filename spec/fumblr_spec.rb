require 'spec_helper'
require File.join(File.dirname(__FILE__), '..', 'fumblr.rb')

set :environment, :test

describe 'Fumblr' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should == 'foo'
  end
end
