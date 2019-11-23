$fail = true
$counter = 0
def stockPicker x
    puts x.to_s
    comparedArray = x.flatten
    buy = nil
    sell = nil
    answer = Array.new
    profit = 0
    comparedArray.each do |buy| 
        x.each do |sell|
            solution = sell - buy
            buyDay = comparedArray.index(buy)
            sellDay = comparedArray.index(sell)
            if profit < solution && buyDay < sellDay then
            profit = solution
            answer = [profit,x.index(buy) +1 ,buy, x.index(sell)+1, sell] 
            end
        end
        
        indexNum = comparedArray.index(buy)
    end
    if profit <= 0 then
        puts "You're SOL buddy"
        $fail = false
    else
    puts "Buy on day #{answer[1]} at #{answer[2]} and sell on day #{answer[3]} for #{answer[4]} for $#{answer[0]} of profit."
    $counter += 1
    end
end

while $fail do
stockPrices = 5.times.map{Random.rand(99)}
stockPicker(stockPrices)
end
puts $counter



