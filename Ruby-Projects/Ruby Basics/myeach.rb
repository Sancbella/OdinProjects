module Enumerable
    def my_each(arr)
      for i in 0...arr.length-1 do
        yield(arr[i])
      end
    end
    def my_each_with_index(arr)
        for i in 0...arr.length-1 do
            yield(arr[i],i)
        end
    end
    def my_select(arr,arg)
        for i in 0...arr.length-1 do
            nArray = []
            nArray << arr[i] if arr[i] == arg
            yield(nArray)
        end
    end
    def my_all?(arr,arg)#my_all?([1,2,3],1){|x| puts ${x}}
        falser = true
        for i in 0...arr.length-1 do
            if arg[i] != arg
                falser = false
            end
            yield(falser)
        end
    end
    def my_none?(arr,arg)
        truther = true
        for i in 0...arr.length-1 do
            if arg[i] == arg
                falser = true
            end
            yield(truther)
        end
    end
    def my_count(arr,arg)
        counter = 0
        for i in 0...arr.length-1 do
            if arr[i] == arg 
                counter += 1
            end
        end
        yield(counter)
    end
    def my_map(arr,arg)
        for i in 0...arr.length-1 do
            arr[i] = arr[i] + arg
        end
        yield(arr)
    end
    def my_inject(arr,arg) ##NEED HELP
        sum = 0
        for i in 0...arr.length-1 do
            arg
        end
        yield(sum)
    end
    def multiply_els(arr,arg) #multiply_els([2,4,5]) #=> 40
        for i in 0...arr.length-1 do
        my_inject(arr,)
  end
end
=begin
Create #my_each, a method that is identical to #each but (obviously) does not use #each. You’ll need to remember the yield statement. Make sure it returns the same thing as #each as well.
Create #my_each_with_index in the same way.
Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
Create #my_all? (continue as above)
Create #my_any?
Create #my_none?
Create #my_count
Create #my_map
Create #my_inject
=end