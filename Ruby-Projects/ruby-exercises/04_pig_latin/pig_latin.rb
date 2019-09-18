#write your code here
def translate x
x = x.split(" ")

# for each word, check to see if first letter starts with consonant
# until first letter is vowel
final = x.map { |word|
    puts word + 'is the word'
    letters = word.split ''
    puts letters
    while letters[0] != 'a' && letters[0] != 'e' && letters[0] != 'i' && letters[0] != 'o' do
        puts letters[0]
        letters.push(letters[0])
        letters.shift()
        puts letters[0] + 'after shift'
    end
    word = letters.join()
    word = word.to_s + 'ay'
}
    final = final.join(" ")
    final
end
translate("the quick brown fox")