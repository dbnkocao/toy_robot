require 'sinatra'
require './lib/board'
require './lib/robot'
require './lib/robot_simulator'
require 'byebug'

get '/' do
  erb :index
end

post '/place' do
  place

  @robot = @robot_simulator.robot

  erb :index
end

post '/move' do
  place

  if !@robot_simulator.robot.nil?
    @robot_simulator.movement(params[:instruction])
    @robot = @robot_simulator.robot
  end

  erb :index
end

def place
  instruction = "PLACE #{ params[:x] },#{ params[:y] },#{ params[:face_to] }"

  @robot_simulator = RobotSimulator.new

  @robot_simulator.movement(instruction)
end