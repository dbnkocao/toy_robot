class Board
  VERTICAL_SIZE = 5
  HORIZONTAL_SIZE = 5

  def valid_position?(x, y)
    x >= 0 && x < HORIZONTAL_SIZE && y >= 0 && y < VERTICAL_SIZE
  end
end