class RobotSimulator
  attr_reader :board
  attr_accessor :robot, :command, :x, :y, :face_to

  def initalize
    self.board = Board.new
  end

  def movement(instruction)
    extract_instruction(instruction)

    return if @robot.nil? && command != 'PLACE'

    execute_command
  end

  def extract_instruction(instruction)
    regex_instruction = /(^\w*) ?(\d)?,?(\d)?,?(\w*)/

    if regex_instruction =~ instruction
      @command = $1
      @x = $2.to_i
      @y = $3.to_i
      @face_to = $4
    end
  end

  def execute_command
    case @command
      when 'PLACE'
        @robot = Robot.new(@x, @y, @face_to)
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