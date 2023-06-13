# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative '../views/view'
require 'pry-byebug'

# This class is responsible for the game logic
class Game
  attr_reader :running

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @view = View.new
    @turns = 0
    @running = @board.valid_board
  end

  def play
    # @turns.even? ? mark_space(@player1) : mark_space(@player2) while @running
    @turns.even? ? player_turn(@player1) : player_turn(@player2) while @running
    # @view.print_message('Game over!')
  end

  private

  def player_turn(player)
    input = @view.get_player_input(player.name) # get input from player
    if valid_input?(input)
      input_index = input.to_i - 1
      @board.cells[input_index].instance_of?(Integer) ? mark_space(player, input_index) : @view.already_taken(@board.cells)
    else
      input_is_not_a_number(player)
    end
  end

  def mark_space(player, index)
    @board.cells[index] = player.symbol
    @turns += 1
    @view.display_board(@board.cells)
  end

  def valid_input?(input)
    valid_numbers = %w[1 2 3 4 5 6 7 8 9]
    valid_numbers.include?(input)
  end

  def input_is_not_a_number(player)
    puts 'Please enter a valid number'
    @view.display_board(@board.cells)
    player_turn(player)
  end
end
