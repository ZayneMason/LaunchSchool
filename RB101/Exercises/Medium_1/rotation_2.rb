# Write a method that can rotate the last n digits of a number.
# You may use the method we made in rotation.r for this

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_digits(digits, amount)
  digits_arr = digits.to_s.split('')
  digits_arr[-amount..-1] = rotate_array(digits_arr[-amount..-1])
  digits_arr.join.to_i
end

# Tests:
puts rotate_digits(735291, 1) == 735291
puts rotate_digits(735291, 2) == 735219
puts rotate_digits(735291, 3) == 735912
puts rotate_digits(735291, 4) == 732915
puts rotate_digits(735291, 5) == 752913
puts rotate_digits(735291, 6) == 352917
puts rotate_digits(123456, 3)