# Write a method that takes one argument, a positive integer, and returns a string
# of alternating 1's and 0's, always starting with 1. The length should match the given integer.

def stringy(num)
  string = '1'
  counter = 0
  until counter == num - 1
    counter.even? ? string << '0' : string << '1'
    counter += 1
  end
  string
end

# Tests:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
