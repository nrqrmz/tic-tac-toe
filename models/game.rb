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
    @turns.even? ? player_turn(@player1) : player_turn(@player2) while @running && @turns < 9
    @view.print_message("It's a draw.\nGame over!")
  end

  private

  # this method is called when it's the player's turn
  def player_turn(player)
    input = @view.get_player_input(player.name) # get input from player
    if valid_input?(input)
      input_index = input.to_i - 1
      @board.cells[input_index].instance_of?(Integer) ? mark_space(player, input_index) : @view.already_taken(@board.cells)
    else
      input_is_not_a_number(player)
    end
  end

  # this method validates that the user input is a number between 1 and 9
  def valid_input?(input)
    valid_numbers = %w[1 2 3 4 5 6 7 8 9]
    valid_numbers.include?(input)
  end

  # this metohd marks the space on the board with the player's symbol
  def mark_space(player, index)
    @board.cells[index] = player.symbol
    @turns += 1
    @view.display_board(@board.cells)
    @view.print_message("#{player.name} wins!") if check_winner(player.symbol)
    @running = false if check_winner(player.symbol)
  end

  # this method is called when the user input is not a number
  def input_is_not_a_number(player)
    @view.display_board(@board.cells)
    puts 'Please enter a valid number'
    player_turn(player)
  end

  def check_winner(player_symbol)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |index| @board.cells[index] == player_symbol }
    end
  end

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [0, 4, 8], [2, 4, 6] # diagonal
  ].freeze
end
