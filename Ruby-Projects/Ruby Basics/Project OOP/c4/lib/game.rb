require_relative "board"
require_relative "player"

puts "Welcome to Connect 4!"

board = Board.new

current_player = player1 = Player.new(name: "Chris", symbol: 1)
player2 = Player.new(name: "Silvia", symbol: -1)

while board.is_playable?
  board.display

  puts "It's #{current_player.name}'s turn!"
  puts ""
  puts "Please select the column you'd like to place your piece"

  selected_column = gets.to_i

  #checks to see if column can be played
  #if so, the player plays the column and passes the board thru the script
  if board.column_can_be_played?(selected_column) 
    current_player.play_column(board, selected_column)
  else
    puts "This column isn't playable"
    next
  end

  if board.won?
    puts "Congrats #{current_player.name}! You win!"
    #win check 
  elsif board.draw?
    puts "We have a draw, play again?"#draw check 
  else
    current_player = (player1 == current_player) ? player2 : player1
    system("clear")
  end
    #changes player
    #clears system
end


