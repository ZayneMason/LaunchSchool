# What happens when we modify an array while we are iterating over it?
# What would the output of this code?:
numbers = [1, 2, 3]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# Array#shift removes the first element and returns it, when given an argument, it returns an array of the elements before it and removes them from the original array
# The code will print whichever number it is on, since 1 is first it will print that, then remove 2, since two is removed it will print 3, 
# after printing 3, 4 is removed, ending the loop