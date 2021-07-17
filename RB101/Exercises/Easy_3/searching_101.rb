# Write a program that solicits 6 numbers from the user, then prints a message that
# describes whether or not the 6th number appears amongst the first 5 numbers

arr = []
puts '=>Please enter number one:'
arr << gets.chomp.to_i
puts '=>Please enter number two:'
arr << gets.chomp.to_i
puts '=>Please enter number three:'
arr << gets.chomp.to_i
puts '=>Please enter number four:'
arr << gets.chomp.to_i
puts '=>Please enter number five:'
arr << gets.chomp.to_i
puts '=>Please enter number six:'
sixth_num = gets.chomp.to_i

if arr.include?(sixth_num)
  puts "=>The sixth number appears earlier in #{arr}."
else
  puts "=>The sixth number does not appear in #{arr}."
end
