class Caesar
    
$letter_To_Numbers = {
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26
}
$numbers_To_Letters = {
    1 => "a",
    2 => "b",
    3 =>"c",
    4 =>"d",
    5 =>"e",
    6 =>"f",
    7 =>"g",
    8 =>"h",
    9 =>"i",
    10 =>"j",
    11 =>"k",
    12 =>"l",
    13 =>"m",
    14 =>"n",
    15 =>"o",
    16 =>"p",
    17 =>"q",
    18 =>"r",
    19 =>"s",
    20 =>"t",
    21 =>"u",
    22 =>"v",
    23 =>"w",
    24 =>"x",
    25 =>"y",
    26 =>"z"
}
$finalWord = Array.new
def cipher(word, count) 
    word.each_char.map{|letter| encrypt(letter, count)}  
    $finalWord = $finalWord.join('')
    output = $finalWord
    $finalWord = Array.new
    return output
end
def encrypt(letter, count)
    u = nil
    if letter == letter.upcase then
        u = true
    end
    if letter =~ /[A-Za-z]/ then
        letter = letter.downcase
        coded = $letter_To_Numbers[letter.to_s] 
        coded = (coded.to_i + count) % 26
        letter = $numbers_To_Letters[coded.to_i]
        if u then
            $finalWord.push(letter.upcase)
            else
            $finalWord.push(letter)
            end
        else
        $finalWord.push(letter)
    end
end
end

cypher = Caesar.new
cypher.cipher('Hells yea', 5)
cypher.cipher('Hello', 5)