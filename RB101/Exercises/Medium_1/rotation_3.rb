# Write a method that takes an integer as an argument, and returns the maximum rotation of that argument.
# You can use the method we made in rotation_2.rb.
# We do not need to handle 0's

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_digits(digits, amount)
  digits_arr = digits.to_s.split('')
  digits_arr[-amount..-1] = rotate_array(digits_arr[-amount..-1])
  digits_arr.join.to_i
end

def max_rotation(numbers)
  digits = numbers.to_s.size
  digits.downto(2) do |n|
    numbers = rotate_digits(numbers, n)
  end
  numbers
end

# Tests:
puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
