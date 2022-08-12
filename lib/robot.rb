class Robot
  attr_writer :x_cordinate, :y_cordinate, :face_to

  def initalize(x = 0, y = 0)
    self.x_cordinate = x
    self.y_cordinate = y
  end
end