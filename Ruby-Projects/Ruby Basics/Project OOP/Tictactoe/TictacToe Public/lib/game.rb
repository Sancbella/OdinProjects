class Game
    require_relative "player"
    require_relative "board"
    def initialize
        @win_combos = [[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,1,2],[3,4,5],[6,7,8],[0,4,8]]
        @current_player = nil
        @@current_round = Board.new
        @player1 = Player.new('Silvia', 'X')
        @player2 = Player.new('Chris', 'O')
    end
    def play
        def self.intro
            #puts intro statement
            puts "Hello! Welcome to the TickyTacky game"
            puts "What is your name, Player 1?"
            @p1name = gets.chomp
            puts "Great how about you, Player 2?"
            @p2name = gets.chomp
            puts "Great now, lets get started, good luck, and have fun!"
        end
        self.intro
        @@current_round = Board.new
        @player1.name = @p1name
        @player2.name = @p2name
        @current_player = @player1
            while won? == false && tie? == false
                run_turn
            end
            play_again?
        end
    def run_turn
        
        @@current_round.display
        loop do 
            puts "Alright! #{@current_player.name}, you're up!"
            puts "Please give me a number 1 thru 9 -- You're #{@current_player.symbol}"
            choice = gets.chomp.to_i
            next unless choice.between?(1,9) && occupied?(choice)
            "Let it be so!"
            @current_player.moves.push(choice-1)
            #literally, accesses the array, takes the last number added to the current player array, substracts 1 from it and uses it as a boards index
            # from there it sets that element as the current player's symbol 
            @@current_round.board[@current_player.moves[-1]] = @current_player.symbol
            break
        end
        case @current_player
        when @player1
            @current_player = @player2
        when @player2
            @current_player = @player1
        end
    end
    def won?(p1moves = @player1.moves, p2moves = @player2.moves)
        move_combos1 = p1moves.combination(3).to_a
        move_combos2 = p2moves.combination(3).to_a
        @win_combos.each do |i|
            ## compare each win # in each sub-array with the players array

            move_combos1.each do |j|
                if i.sort == j.sort
                    @@current_round.display
                    puts "Congrats #{@player1.name}, you win!"
                    return true
                end
            end
            move_combos2.each do |j|
                if i.sort == j.sort
                    @@current_round.display
                    puts "Congrats #{@player2.name}, you win!"
                    return true
                end
            end
        end
        return false
    end
    def occupied?(choice)
        #takes the choice and x-refs with board
        @@current_round.board[choice - 1].class == Integer ? true : false #if current space is integer then true

    end
    def tie?
        if @@current_round.board.none? Integer
            puts "You've got a tie!"
            return true
        else 
            return false
        end
    end
    def play_again?
        x = nil
        loop do
            puts 
            puts "-------+-------"
            puts "Wanna play again? Y/N"
            x = gets.chomp.upcase
            next unless x == 'Y'||'N'
            break
        end
        case x
        when 'Y'
            system "clear"
            Game.new.play
        when 'N'
            puts "Okay then, thanks for playing!"
        end
    end
end