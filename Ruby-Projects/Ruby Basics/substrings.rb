body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquam sagittis sapien non consequat. Fusce non leo sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate molestie nunc, at commodo massa sollicitudin vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eget orci eget ipsum dictum dictum. Duis mattis pharetra ligula a tempus.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis vehicula arcu, quis ultricies elit tincidunt eget. Cras nisi elit, tincidunt nec turpis in, sollicitudin rhoncus mauris. Aliquam quis finibus nulla, non finibus elit. Aliquam a posuere ex. Mauris et turpis id sapien posuere lobortis. Praesent sollicitudin justo vel sem bibendum, ac mattis nunc sodales. Integer mi arcu, sodales a placerat quis, ornare ultricies tortor. Nulla ante arcu, mattis ut lorem sit amet, pulvinar porta urna. Aenean egestas venenatis dui, quis tempus diam volutpat vulputate. Maecenas non pharetra orci, nec volutpat nibh. Nam eu mollis massa, rutrum pharetra lacus. Ut ultricies lacus in lorem viverra molestie.

Integer faucibus ante risus, a tincidunt turpis consequat sit amet. Sed nunc velit, porta a orci tempor, finibus accumsan sapien. Aliquam ut aliquet orci, in sollicitudin ipsum. Aliquam at elit a tortor consectetur aliquet. Vestibulum dignissim dignissim odio nec convallis. Pellentesque viverra tempus purus et cursus. Etiam pharetra, lectus a semper pharetra, dolor augue consequat ante, id mollis tellus sem quis ex. Aliquam imperdiet nisi neque, ut tempor sapien euismod non. Sed elit est, dapibus a dui nec, aliquam convallis felis.

Aenean id massa congue, egestas leo vel, consectetur magna. Phasellus laoreet justo luctus dictum molestie. Praesent non nulla mollis, sodales erat nec, vulputate lectus. Donec lectus urna, auctor sit amet egestas quis, dictum ac turpis. Proin egestas velit et eros volutpat viverra. Phasellus rutrum ex vel luctus auctor. In eleifend placerat nisi, vitae scelerisque urna consectetur at. Sed porttitor tristique enim, et mollis eros tempus ut. Maecenas a cursus est. Sed luctus neque mi, sed consectetur erat lobortis ac. Sed viverra, arcu in varius facilisis, sem nisl gravida nulla, quis convallis odio libero ut urna. Vestibulum quis vulputate dui. Fusce at eros magna.

Duis a lacinia libero. Integer pretium porttitor turpis, in gravida nibh ornare placerat. Cras lorem tellus, elementum rutrum ultrices vel, cursus at diam. Morbi eget elementum purus, ut tincidunt leo. Proin felis magna, lacinia et ullamcorper vel, vestibulum a nibh. Pellentesque convallis libero sit amet egestas consequat. Cras commodo pellentesque fringilla. Aenean vel nisi odio."

input = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc venenatis lorem dui, vel vulputate ligula porttitor nec. Fusce luctus massa sit amet eros ultricies dapibus. Sed nec dictum nunc, id aliquam lorem. Maecenas consequat imperdiet lectus, ut malesuada nisi dignissim finibus. In volutpat velit sed faucibus eleifend. Phasellus vehicula massa elementum, vestibulum lectus vitae, fringilla nibh. Ut elementum lacus nec ligula porta dapibus. In nulla orci, tincidunt a purus in, congue commodo nulla. Curabitur vitae nunc tellus. Donec at neque vel nisl viverra aliquet."

def substrings (input,source)
    counter = Hash.new
    source = source.split(' ')
    input = input.split(' ')
    source.each do |word|
        indexNum = source.index(word)
        word = word.downcase
        source[indexNum]= word.gsub(/\W/, '')
        counter = {word => 0}
    end
    input.each do |word|
        indexNum = input.index(word)
        word = word.downcase
        input[indexNum] = word.gsub(/\W/, '')
    end
    source = source.uniq
    source.each do |sourceWord| 
        input.each do |inputWord| 
            if inputWord == sourceWord then
                value = counter[sourceWord].to_i + 1
                counter.store(sourceWord, value)
            end
        end
    end
puts counter.to_s
end
substrings(input ,body)
