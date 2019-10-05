needs_sorting = [4,3,78,2,0,2]
needs_sortingstr =["hi","hello","hey"]
def bub_sort(array)
    swapped = true #sets swapped as true for it to run once
    until !swapped do #stop once swapped is false
        swapped = false #sets swap as false becaue the loop sets as true if else
        for i in 0...array.length-1 do #tells it to loop each time based off of the numbers in array
            if array[i] > array[i+1] #if 1 is bigger than 2 then... 
                array[i], array[i+1] = array[i+1], array[i] #swaps them
                swapped =  true #sets swapped as true because it fired a correction
            end
        end
    end
    return array.to_s
end
puts bub_sort(needs_sorting)

puts bub_sort(needs_sortingstr)