class Robot
  attr_accessor :cordinate_x, :cordinate_y, :face_to

  FACE_POSITIONS = ['NORTH','EAST','SOUTH','WEAST']

  def initialize(x = 0, y = 0, face = 'EAST')
    self.cordinate_x = x
    self.cordinate_y = y
    self.face_to = face
  end

  def move
    @cordinate_y = @cordinate_y - 1 if @face_to == 'NORTH'
    @cordinate_y = @cordinate_y + 1 if @face_to == 'SOUTH'
    @cordinate_x = @cordinate_x + 1 if @face_to == 'EAST'
    @cordinate_x = @cordinate_x - 1 if @face_to == 'WEAST'
  end

  def right
    current_index = FACE_POSITIONS.index(@face_to)

    new_index = FACE_POSITIONS.size - current_index - 1

    @face_to = FACE_POSITIONS[-new_index]
  end

  def left
    current_index = FACE_POSITIONS.index(@face_to)

    @face_to = FACE_POSITIONS[current_index - 1]
  end

  def report
    puts "x = #{ @cordinate_x }"
    puts "y = #{ @cordinate_y }"
    puts "face = #{ @face_to }"
  end
end