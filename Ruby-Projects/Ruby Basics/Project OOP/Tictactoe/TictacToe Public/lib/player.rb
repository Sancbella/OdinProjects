class Player
    attr_accessor :name, :symbol, :moves
    def initialize name,symbol,player = []
        @name = name
        @symbol = symbol
        @moves = []
    end
end