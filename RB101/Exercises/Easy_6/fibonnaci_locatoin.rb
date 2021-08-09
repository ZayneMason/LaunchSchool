# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

# Examples/Test cases:
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847


# Problem: 
# -- input: integer
# -- output: integer
# -- goal: find the first number in the sequence with the amount of input digits and return it's index
# -- fib sequence is a sequence of numbers where each number and the number before it are added to get the next number
# -- 1, 1, 2, 3, 5, 8, 13, 21

# From examples: 
# -- because the index of number 1 is 1, what we can do is either fill in 0 with a 0 and the sequence will still work
# -- we could also do [index + 1] for the return
# -- We are going to need to build an array
# -- The method should not crash the computer and build the array up to the digit, otherwise it would go forever

# Data Structure: array

# Algo/Logic
# -- defining the method
# -- we are going to use the argument as a length measurment of an integer, we can convert it to a string easily and use String#length
# -- we need to create a place holder array to store the integers, we can call it storage_arr and start with values 0 and 1 stored
# -- we can use a variable to store our current number in the sequence that is being added to the storage_arr
# -- create a counter variable that we will start at 2, as that will be the first index we add.
# -- create an until loop that will break whenever our number.to_s.length == argument integer
# -- each iteration append the result of current_num + storage_arr[counter - 1]
# -- return the final index of the array with the counter variable

def find_fibonacci_index_by_length(int)
  storage_arr = [0, 1]
  current_num = 1
  counter = 2
  until current_num.to_s.length == int
    storage_arr << current_num
    current_num += storage_arr[counter - 1]
    counter += 1
  end
  counter
end

# Test cases: 
puts(find_fibonacci_index_by_length(2) == 7,
find_fibonacci_index_by_length(3) == 12,
find_fibonacci_index_by_length(10) == 45,
find_fibonacci_index_by_length(100) == 476,
find_fibonacci_index_by_length(1000) == 4782,
find_fibonacci_index_by_length(10000) == 47847)
