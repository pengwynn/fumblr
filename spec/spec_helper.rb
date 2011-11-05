require 'rack/test'
require 'sinatra'
require 'sinatra/contrib'


RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end


