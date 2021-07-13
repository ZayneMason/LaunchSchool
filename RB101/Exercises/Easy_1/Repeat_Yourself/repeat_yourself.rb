# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat_times(str, amount)
  amount.times {puts str}
end

repeat_times('Hi!', 4)
