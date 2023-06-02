require_relative 'player'

class Game
  attr_reader :running

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = build_board
    @turns = 0
    @running = valid_board

    display_board
  end

  def play
    @turns.even? ? mark_space(@player1) : mark_space(@player2) while @running
    puts 'Game over!'
  end

  private

  def build_board
    (1..9).to_a
  end

  def display_board
    arr = []
    @board.each_slice(3) { |tri| arr << tri }
    arr.each { |line| p line }
  end

  def valid_board
    @board.uniq.count > 2
  end

  def mark_space(player)
    symbols = %w[X O]
    puts "Please pick a number, #{player.name}"
    print '> '
    space_index = gets.chomp.to_i - 1
    
    @turns += 1
  end
end
