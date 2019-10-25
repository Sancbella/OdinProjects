$dictionary = File.readlines "5desk.txt"
$wordlist = []
$dictionary.each do |x|
    if x.chomp.length <= 12 && x.chomp.length >= 5 
        $wordlist << x.chomp
    end
end

wordArray =[]
class Game
    attr_accessor :wordArr, :hiddenWordArr
    def initialize
        word = $wordlist.shuffle[0].downcase
        @selectedWord = word.to_s
        @hiddenWordArr = []
        word.length.times do @hiddenWordArr << "- " end
        @wordArr = []
        word.each_char{ |c| 
            @wordArr << c
            }
        @wrongAnswerArray = []
        @endgame = false
        @player = Player.new
        play
    end
    def play
        intro
        until @endgame 
            ask_player
            end_game?
        end
        puts 'Play Again? Y/N'
        restart = gets.chomp.downcase
        case restart
        when 'y'
            Game.new
        when 'n'
            system "clear"
            puts "Thanks for playing! Good bye!"
        else puts "I'll take that as a yes"
            Game.new
        end
    end
    def end_game?
        ans = @hiddenWordArr.any? {|x| x == "- "}    
        if @player.wrongChoices == 8
            lose_game
        elsif ans == false
            win_game
        end
    end
    def lose_game
        @endgame = true
        puts "Uh oh you've used up all of your guesses... better luck next time bucko!"
        puts "The answer was #{@selectedWord}"
    end
    def win_game
        @endgame = true
        puts "Congrats you've won the game!"
        puts "Good bye!"
    end
    def intro
        puts %Q(
        :.:.:.:.:.::.:.:.:.:.::.:.:.:.:.::.:.:.:.:.::.:.:.:.:.::.:.:
        Step up, one and all! It's time to give yourself a try at...
        888                                                          
        888                                                           
        888                                                           
        88888b.  8888b. 88888b.  .d88b. 88888b.d88b.  8888b. 88888b.  
        888 "88b    "88b888 "88bd88P"88b888 "888 "88b    "88b888 "88b 
        888  888.d888888888  888888  888888  888  888.d888888888  888 
        888  888888  888888  888Y88b 888888  888  888888  888888  888 
        888  888"Y888888888  888 "Y88888888  888  888"Y888888888  888 
                                    888                              
                                Y8b d88P                              
                                "Y88P"       
        
        Now let's get started! You have a #{@wordArr.length} letter word

        Here's the word....
        #{@hiddenWordArr.join}
        )
    end
    def display_board
        puts %Q(
            You have used #{@player.wrongChoices}/8 guesses 
            The letters you've guessed so far are #{@player.chosenLetters}
            The letters that are wrong so far are #{@wrongAnswerArray}
            
            Here's the word....
            #{@hiddenWordArr.join}
        )
    end
    def ask_player
        isletter = false
        choice = nil
        until isletter 
            puts 'Give me a letter!'
            choice = gets.chomp.downcase
            if choice =~ /[a-z]/ && choice.length == 1
                isletter = true
                if @player.chosenLetters.to_a.any?(choice)
                    puts "You've already played this..."
                    isletter = false
                else 
                    @player.chosenLetters << choice
                    isletter = true
                end
            else
                isletter = false
                puts %q(This isn't an individual letter dumbass)
            end    
        end
            char_check(choice)
    end
    def char_check(choice)
        pass = false
            @wordArr.each {|x| 
            if x == choice
                @hiddenWordArr[@wordArr.index(x)] = "#{choice} "
                @wordArr[@wordArr.index(x)] = '0'
                pass = true
            end
            }
        if pass
            puts "Nice job! You've got one"
            display_board
        elsif !pass
            wrongAnswer(choice)
        end
    end
    def wrongAnswer(choice)
        puts 'Oopsies, this is wrong...'
        @player.wrongChoices += 1
        @wrongAnswerArray << choice
        display_board
    end
end

class Player < Game
    attr_accessor :chosenLetters, :wrongChoices
    def initialize
    @chosenLetters = []
    @wrongChoices = 0
    end
end
Game.new

