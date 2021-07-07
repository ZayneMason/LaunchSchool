# Given the following data structure, return a new array containing the same sub arrays
# as the original but ordered logically by only taking into consideration the odd numbers
# they contain
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |sub|
  odd_numbers = []
  sub.each do |number|
    odd_numbers << number if number.odd?
  end
  odd_numbers
end

# Refactored better
arr.sort_by do |sub|
  sub.select do |number|
    number.odd?
  end
end
# Each do is not necessary, we can make an odd numbers array with select
