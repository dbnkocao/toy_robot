require 'byebug'
class RobotSimulator
  attr_reader :board
  attr_accessor :robot

  def initalize
    self.board = Board.new
  end

  def movement(instruction)
    regex_instruction = /(^\w*) ?(\d)?,?(\d)?,?(\w*)/
    command, x ,y, face_to = nil

    if regex_instruction =~ instruction
      command = $1
      x = $2.to_i
      y = $3.to_i
      face_to = $4
    end

    return if @robot.nil? && command != 'PLACE'

    case command
      when 'PLACE'
        self.robot = Robot.new(x, y, face_to)
      when 'LEFT'
        @robot.left
      when 'RIGHT'
        @robot.right
      when 'MOVE'
        @robot.move
      when 'REPORT'
        @robot.report
      else
        puts "Invalid Coommand!"
    end
  end
end