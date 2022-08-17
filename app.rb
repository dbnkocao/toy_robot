require 'sinatra'
require './lib/board'
require './lib/robot'
require './lib/robot_simulator'

get '/' do
  erb :index
end

get '/place' do
  erb :index
end
