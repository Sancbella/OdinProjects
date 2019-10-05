class Gamepiece 
    def askplayer
        puts "Please select where to put your #{@@piece}"
        coordinate = gets.chomp if gets.chomp {1...9}
    end
    def place(coordinate)
        if !checkifoverwrite(coordinate)
            @map[coordinate-1] = @@piece
        end
    end
    def checkoverwrite(coordinate)
        if @map[coordinate-1] != [1...9]
            true
        else
            false
        end
    end
end

class Tic < Gamepiece
 @@placement_countx = 0
 @@piece = 'X'
end

class Tac < Gamepiece
    @@placement_counto = 0
    @@piece = 'O'
end


class Board
    @map = Array.new[1...9] 
    @win = false
    def checkifwin
        if @placement_counto >= 3 || @placement_countx >= 3
            mapcheck
        end
    end
    def win?
        #tic
        if 
            yield([0,4,8],'X') ? @win = true : @win = false
        yield([0,3,6],'X')? @win = true : @win = false
        yield([1,4,7],'X')? @win = true : @win = false
        yield([2,5,8],'X')? @win = true : @win = false
        yield([2,4,6],'X')? @win = true : @win = false
        yield([0,1,2],'X')? @win = true : @win = false
        yield([3,4,5],'X')? @win = true : @win = false
        yield([6,7,8],'X')? @win = true : @win = false
        #tac
        yield([0,4,8],'O')? @win = true : @win = false
        yield([0,3,6],'O')? @win = true : @win = false
        yield([1,4,7],'O')? @win = true : @win = false
        yield([2,5,8],'O')? @win = true : @win = false
        yield([2,4,6],'O')? @win = true : @win = false
        yield([0,1,2],'O')? @win = true : @win = false
        yield([3,4,5],'O')? @win = true : @win = false
        yield([6,7,8],'O')? @win = true : @win = false
        ## check for all options, use any/select/etc
    end
    def mapcheck
        @map.win?{|coords, piece| @map[coords].all?{|coord| coord == piece }}
    end
end