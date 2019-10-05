to_sort = [4,3,78,2,0,2]
to_sort_str =["hi","hello","hey"]
def bubbleSort(nums)
    completed = false
    until completed do
        completed = true
        for i in 0...nums.length-1 do
            if nums[i] > nums[i+1]
                nums[i], nums[i+1] = nums[i+1], nums[i]
                completed = false
            end
        end
    end
    return nums.to_s
end 

puts bubbleSort(to_sort)
puts bubbleSort(to_sort_str)
