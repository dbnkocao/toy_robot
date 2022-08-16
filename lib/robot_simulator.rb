class RobotSimulator
  attr_reader :board
  attr_accessor :robot, :command, :x, :y, :face_to

  def initialize
    @board = Board.new
  end

  def movement(instruction)
    extract_instruction(instruction)

    return if robot.nil? && command != 'PLACE'

    execute_command
  end

  def extract_instruction(instruction)
    regex_instruction = /(^\w*) ?(\d)?,?(\d)?,?(\w*)/

    if regex_instruction =~ instruction
      @command = $1
      @x = $2.to_i
      @y = $3.to_i
      @face_to = $4 if Robot::FACE_POSITIONS.include?($4)
    end
  end

  def execute_command
    original_robot = robot.dup

    case command
      when 'PLACE'
        @robot = Robot.new(x, y, face_to)
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right
      when 'MOVE'
        robot.move
      when 'REPORT'
        robot.report
      when 'QUIT'
        puts 'Thanks for playing!'
      else
        puts 'Invalid Command! Try Again!'
    end

    @robot = original_robot unless board.valid_position?(robot.cordinate_x, robot.cordinate_y)
  end
end