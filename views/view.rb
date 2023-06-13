# frozen_string_literal: true

# This class is responsible for creating a view to display the game and get user inputs
class View
  def print_message(smth)
    puts smth
  end

  def get_player_input(player_name)
    puts "Please pick a number, #{player_name}"
    print '> '
    gets.chomp
  end

  def already_taken(cells)
    display_board(cells)
    puts 'This one is already taken'
    puts 'Pick another one...'
  end

  def display_board(cells)
    print `clear`
    arr = []
    cells.each_slice(3) { |tri| arr << tri }
    arr.each { |line| puts line.join(' ') }
  end
end
