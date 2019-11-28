class Piece
    def take(captor,victim,space)
        # Removes the pieces 'space'
        # @alive = false
    end
end

class King < Piece
    attr_accessor: :space
    attr_reader :color
    def initialize(color: color, space: space)
        @color = color,
        @space = space,
        @alive = true
    end

    def move(space)
    
    end
end

class Queen < Piece
    attr_accessor: :space
    attr_reader :color

    def initialize(color: color, space: space)
        @color = color,
        @space = space,
        @alive = true
    end

    def move(space)
    
    end
end

class Rook < Piece
    attr_accessor: :space
    attr_reader :color

    def initialize(color: color, space: space)
        @color = color,
        @space = space,
        @alive = true
    end

    def move(space)
    
    end
end

class Knight < Piece
    attr_accessor: :space
    attr_reader :color
    
    def initialize(color: color, space: space)
        @color = color,
        @space = space,
        @alive = true
    end

    def move(space)
    
    end
end

class Bishop < Piece
    attr_accessor: :space
    attr_reader :color
    
    def initialize(color: color, space: space)
        @color = color,
        @space = space,
        @alive = true
    end

    def move(space)
    
    end
end

class Pawn < Piece
    attr_accessor: :space
    attr_reader :color

    def initialize(color: color, space: space)
        @color = color,
        @space = space,
        @alive = true
        @move_count = 0
    end

    def move(space)
    
    end
end