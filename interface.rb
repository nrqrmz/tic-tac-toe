require_relative './models/game.rb'

puts 'Welcome'
puts "Let's play Tic, Tac, Toe"
puts 'Player 1, please enter your name:'
print '> '
player1 = Player.new(gets.chomp.capitalize, 'X')
puts 'Player 2, please enter your name:'
print '> '
player2 = Player.new(gets.chomp.capitalize, 'O')
game = Game.new(player1, player2)
game.play
