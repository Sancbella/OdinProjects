class Board
    attr_accessor :board
    def initialize
        @@board = [1,2,3,4,5,6,7,8,9]
    end
    def board ##why is this here? to access the array itself
        @@board
    end
    def display
        puts " "
        puts "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
        puts "--+---+---"
        puts "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
        puts "--+---+---"
        puts "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
        puts " "
    end
end