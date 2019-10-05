class Player
    attr_accessor :name, :symbol, :moves
    def initialize name, symbol
        @name = name
        @symbol = symbol
        @moves = []
    end
    def moves
        @moves
        puts " #{self.moves}"
    end
end