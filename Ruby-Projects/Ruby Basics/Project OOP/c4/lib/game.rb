require_relative "player"
require_relative "board"
class Game
  def initialize
    @turns = 1
    @board = Board.new
    @playerX = Player.new("Chris", "X")
    @playerO = Player.new("Alex", "X")
    @columns_amount = 7
    @rows_amount = 6
    @current_player = @playerO
    
    end
    def horizontal_check
      @rows_amount.times { |row_num| #feach row via getting how many rows there are
      row_array = @board.board[row_num] #sets x row as the array
      row_array.each {|cell| four_in_row?(row_array, cell.to_s)} #iterates over each row's array && runs it through the check
      }
    end
    def vertical_check
      @columns_amount.times {|index| #feach column via getting number of columns in row
      column_array = @board.collect{|row| row[index]} #this collects the x number (ex:1st) of each row to create the column array
      column_array.pop! #removes the numbers at the end
      columns.each{|index| four_in_row?(column_array, index)} #checks the first 3 rows fur wins (Any further has no possible wins due to grid limit)  
    }
    end
    def diagonal_check(board = @board, collection = [])
      #for each diagonal win potentials, collect the object in cell
      position = 0
      length = 4
      row = 1
      board.each{|row| row.each {|cell|
        if cell == current_player.piece then 
          if board[row.index + 1 [[cell.index + 1]]] == current_player.piece then
            collection += current_player.piece
            if board[row.index + 1 [[cell.index + 1]]] == current_player.piece then
              collection += current_player.piece
              if board[row.index + 1 [[cell.index + 1]]] == current_player.piece then
                collection += current_player.piece
              end 
            end 
          end 
        end
        }}
      #run collection thru win check
      fourinarow?(collection)
    end
    def reverse_diagonal_check
    end
    def four_in_row?(row_array, cell)
      if row_array[1...4].all?{|piece| piece.to_s == "x"}
        true
      elsif row_array[1...4].all?{|piece| piece.to_s == "o"}
        true
      else
        false
      end
    end
    # making moves
    def valid?(choice)
      open_spaces = []
      if choice == [1...7] then
        choice = choice - 1
          @board.each { |row|
          if row[choice] == "*" then 
            open_spaces += row 
          end
          }
          selected_row = open_spaces[-1]
          write_to_board(choice, selected_row)
      end
    end
    def write_to_board(choice,selected_row)
      @board[selected_row].map {|e| e.index == choice ? current_player.piece : continue}
    end
    # general methods
    def turn_change
      turn = turn % 2 
      case turn
      when 1 
        current_player = @playerX
      when 0 
        current_player = @playerO
      else 
        put "Something is wrong!"
      end
      turn += 1     
    end
    def play
      loop_game
    end
    def get_answer
      puts "#{@current_player} you're up! Place your #{@current_player.piece}"
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
      show_board
      check_all
      get_answer
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