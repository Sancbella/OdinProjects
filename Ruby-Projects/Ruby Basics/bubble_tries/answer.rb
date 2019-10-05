needs_sorting = [4,3,78,2,0,2]
def bubble_sort(array)
    swapped = true
    until !swapped do
        swapped = false
        for i in 0...array.length - 1 do
            if array[i+1] < array[i]
                array[i], array[i+1] = array[i+1], array[i]
                swapped = true
            end
        end
    end
    return array
end
puts bubble_sort(needs_sorting)

#someone else better than me, not mine