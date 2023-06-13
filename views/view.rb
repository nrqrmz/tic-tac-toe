class View
  def print_message(smth)
    puts smth
  end

  # def get_input

  # end

  def display_board(cells)
    arr = []
    cells.each_slice(3) { |tri| arr << tri }
    arr.each { |line| puts line.join(' ') }
  end
end
