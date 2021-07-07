# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

arr.sort! do |num1, num2|
  # To do decending we need to put second item first.
  num2.to_i <=> num1.to_i
end

puts arr