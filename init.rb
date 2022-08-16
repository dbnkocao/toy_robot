# Dir.children("lib").each { |file| require file }
require './lib/board.rb'
require './lib/robot.rb'
require './lib/robot_simulator.rb'

robot_simulator = RobotSimulator.new

instruction = nil

while instruction != 'QUIT' do
  instruction = gets.chomp

  robot_simulator.movement(instruction)
end

