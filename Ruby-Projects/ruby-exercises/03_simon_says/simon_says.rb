#write your code here
# def simon_says

    def echo x
        x.to_s
    end
    def shout x
        x.to_s.upcase
    end
    def repeat(x, *y)
        if y.length == 0 then
            y = Array.new
            y.push('2')
        end
            y = y.join.to_i
            z = Array.new
            y.times do
                z.push(x)
            end
            z = z.join(" ").to_s
            
    end
    def start_of_word x, y
        y = y-1
        x[0..y]
    end
    def first_word x
        x.chomp
        x.to_s
        x = x.gsub(/\s+/m, ' ').strip.split(" ")
        x[0]
    end
    def titleize x
        x = x.gsub(/\s+/m, ' ').strip.split(" ")
        z = Array.new
        x.each do |word|
            puts word
            if word != "and" && word != "over" && word != "the" then
            word = word.capitalize
            end
            z.push(word)
        end
        z[0] = z[0].capitalize
        z.join(" ").to_s
    end
# end #end of Simon says
titleize("war and peace")