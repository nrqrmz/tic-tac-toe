# frozen_string_literal: true

# This class is responsible for creating a view to display the game and get user inputs
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
