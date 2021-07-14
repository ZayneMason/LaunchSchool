# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the numbers absolute value is odd.
# You may assume the argument is a valid integer.
# You are not allowed to use #odd? or #even?

def is_odd?(number)
  true if number % 2 > 0
end
