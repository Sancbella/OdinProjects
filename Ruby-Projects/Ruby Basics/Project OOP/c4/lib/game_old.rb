require_relative "player"
require_relative "board"

class Game
  def initialize
    @turns = 1
    @board = Board.new
    @playerX = Player.new("Chris", "X")
    @playerO = Player.new("Alex", "O")
    @columns_amount = 7
    # @rows_amount = 6 - 3
    @current_player = @playerO  
  end

  def horizontal_check
    puts "Checking horizontally"
    collection = []
    board.board.each do |row| 
      row.each do |col|
      rval = board.board.index(row)
      cval = board.board[rval].index(col)
        if board.board[rval][cval] == @current_player.piece then
          collection << @current_player.piece
          puts "#{collection.length}/4" 
          if board.board[rval+1][cval == @current_player.piece then
            collection << @current_player.piece
            puts "#{collection.length}/4"
            if board.board[rval+2][cval] == @current_player.piece then
              collection << @current_player.piece
              puts "#{collection.length}/4"
              if board.board[rval+3][cval] == @current_player.piece then
                collection << @current_player.piece
                puts "#{collection.length}/4"
              else
                puts "."
              end
            else
              puts "." 
            end
          else
            puts "." 
          end
        else
          puts "." 
        end
      end
    end
  end
    four_in_row?(collection)
  end
  def vertical_check(board = @board)
    puts "Checking Vertically"
    collection = []
    board.board.each do |row| 
      row.each do |col|
      rval = board.board.index(row)
      cval = board.board[rval].index(col)
        if board.board[rval][cval] == @current_player.piece then
          collection << @current_player.piece
          puts "#{collection.length}/4" 
          if board.board[rval][cval+1] == @current_player.piece then
            collection << @current_player.piece
            puts "#{collection.length}/4"
            if board.board[rval][cval+2] == @current_player.piece then
              collection << @current_player.piece
              puts "#{collection.length}/4"
              if board.board[rval][cval+3] == @current_player.piece then
                collection << @current_player.piece
                puts "#{collection.length}/4"
              else
                puts "."
              end
            else
              puts "." 
            end
          else
            puts "." 
          end
        else
          puts "." 
        end
      end
    end
    four_in_row?(collection)
  end
     
  def diagonal_check(board = @board, collection = [])
    puts "Checking Diagonally"
    board.board.each do |row| 
      row.each do |col|
      rval = board.board.index(row)
      cval = board.board[rval].index(col)
        if board.board[rval][cval] == @current_player.piece then 
          if board.board[rval+1][cval+1] == @current_player.piece then
            collection += @current_player.piece
            if board.board[rval+2][cval+2] == @current_player.piece then
              collection += @current_player.piece
              if board.board[rval+3][cval+3] == @current_player.piece then
                collection += @current_player.piece
              end 
            end 
          end 
        end
      end
    end
    #run collection thru win check
    four_in_row?(collection)
  end
  def reverse_diagonal_check
  end
  def four_in_row?(parsed_row,cell = 0)
    puts "Parsed Row #{parsed_row}"
    if parsed_row.length < 4
      puts "parsed_row is less than 4"
      false 
    elsif parsed_row.count("X") == 4
      puts "player 'x' wins" 
      true
    elsif parsed_row.count("O") == 4
      puts "player 'o' wins"
      true
    else
      puts "else happened in four in a row"
      false
    end
  end
    # making moves
  def valid?(choice)
    choice = choice.to_i
    open_spaces = []
    if choice <= 7 then
      puts "This is doable! Putting in column #{choice}"
      choice = choice - 1
        @board.board.each_index do |row|
          row_array = @board.board[row] 
          if row_array[choice] == "*" then 
            puts @board.board.index(row) 
            open_spaces << row
          else
            puts 'unavailable' 
          end
        end
        puts "this is the selected row #{open_spaces}"
      selected_row = open_spaces[-1]
      write_to_board(choice, selected_row)
      elsif
        puts "You didn't choose any number 1-7"
        get_answer
    end
  end
  def write_to_board(choice,selected_row)
    puts selected_row
    @board.board[selected_row][choice] = @current_player.piece
    choice = choice.to_i
    # @board.board[selected_row].map {|col| @board.board.index(col) == choice.to_i ? @current_player.piece : col}
  end
  # general methods
  def turn_change
    @current_player == @playerO ? @current_player = @playerX : @current_player = @playerO     
  end
  def play
    loop_game
  end
  def get_answer
    puts "#{@current_player.name} you're up! Place your #{@current_player.piece}"
    choice = gets.chomp 
    valid?(choice) 
  end
  def show_board
    @board.display
  end
  def check_all
    if horizontal_check == true || vertical_check == true|| diagonal_check == true || reverse_diagonal_check == true
    return true
    end
  end
  def loop_game
    until check_all == true
      check_all
      show_board
      get_answer
      turn_change
    end
    end_game
  end
  def end_game
    puts "Wanna play again? Y/N"
    choice = gets.chomp
    case choice
    when "Y" 
      puts "Alright lets do it!" 
      Game.new.play
    when "N" 
      puts "okay bye"
    else 
      puts "I guess not"
    end
  end
end