# Write a method that takes one argument, a positive integer,
# and returns a lits of the digits in the number

def digit_list(number)
  number.to_s.split('').each {|num| num.to_i}
end

print digit_list(9823)