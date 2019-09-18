#write your code here
def add x, y
    x + y
end
def subtract x, y
    x-y 
end
def sum array
if array.length == 0 then
    sum = 0
elsif array.length == 1 then
    sum = array[0]
else 
    sum = array.reduce(:+)
end
sum
end
def multiply array
    quotient = array.reduce(:*)
    quotient
end
def power x, y
    power  = x ** y
    power
end
def factorial number
number = number.to_i
numberArray = Array.new
if number == 0 || number == 1 then 
    factor = 1
else
    number.times do
    numberArray.push(number)
    number=number-1
end
factor = numberArray.reduce(:*)
    factor
end
end