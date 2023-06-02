require_relative 'player'
require_relative 'board'

class Game
  attr_reader :running

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @turns = 0
    @running = @board.valid_board

    @board.display_board
  end

  # def play
  #   @turns.even? ? mark_space(@player1) : mark_space(@player2) while @running
  #   puts 'Game over!'
  # end

  # private

  # def mark_space(player)
  #   puts "Please pick a number, #{player.name}"
  #   print '> '
  #   valid_numbers = %w[1 2 3 4 5 6 7 8 9]
  #   input = gets.chomp

  #   if valid_numbers.include?(input)
  #     space_index = input.to_i - 1

  #     if @board[space_index].instance_of? Integer
  #       @board[space_index] = player.symbol
  #       @turns += 1
  #       display_board
  #     else
  #       puts "#{player.name}, this one is already taken"
  #       puts 'Pick another one...'
  #     end
  #   else
  #     puts 'select only a valid number from 1 to 9'
  #   end
  # end
end

game = Game.new(Player.new('merlin', 'x'), Player.new('escanor', 'o'))

