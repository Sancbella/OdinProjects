require_relative "board"
require_relative "player"

puts "Starting game of connect4"

board = Board.new

current_player = player1 = Player.new(name: "Alex", symbol: 1)
player2 = Player.new(name: "Chris", symbol: -1)

while board.is_playable?

  board.display_grid

  puts "It's #{current_player.name}'s turn!"
  puts ""
  print "\nEnter the number of the column you'd like to play, #{current_player.name} :"

  selected_column = gets.to_i

  if board.column_can_be_played?(selected_column)
    current_player.play_column(board, selected_column)
  else
    puts "This column doesn't exist or is not playable. Please pick 1, 2, 3, 4, 5 or 6"
    next
  end

  if board.won?
    puts "Congratulations #{current_player.name}!! You just won this game!"

  elsif board.draw?
    puts "That looks like a draw! Thanks for playing guys!"

  else

    current_player = (player1 == current_player) ? player2 : player1 
    system("clear")
  end
end
