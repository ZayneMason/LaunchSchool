# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. 
# Do not worry about validating the input.

puts '=>Enter your first number:'
num_one = gets.chomp.to_i

puts '=>Enter your second number:'
num_two = gets.chomp.to_i

puts '----------------------------'
puts "#{num_one} + #{num_two} = #{num_one + num_two}"
puts "#{num_one} - #{num_two} = #{num_one - num_two}"
puts "#{num_one} * #{num_two} = #{num_one * num_two}"
puts "#{num_one} / #{num_two} = #{num_one / num_two}"
puts "#{num_one} % #{num_two} = #{num_one % num_two}"
puts "#{num_one} ** #{num_two} = #{num_one ** num_two}"
puts '----------------------------'
