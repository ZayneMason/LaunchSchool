# Given this code what will be the final values of a and b?
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
puts a 
puts "#{b}"

# Try to solve before running.

# arr will be [2, [5, 8]], so arr[0] += 2 would be 4
# since numbers are immutable and arr[0] += 2 is modifying the array, it is just reassigning the value in the array,
# not changing the a object, so a remains 2

# Since arr[1][0] -= a is modifying a value within an array object, b is [3, 8]
