# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

def valid_number?(number)
  number.to_i.to_s == number
end

def sum(number)
  (1..number.to_i).to_a.inject(:+)
end

def product(number)
  (1..number.to_i).to_a.inject(:*)
end

puts '=>Please enter an integer greater than 0.'
int = gets.chomp
loop do
  break if valid_number?(int)

  puts '=>Please enter a valid number.'
  int = gets.chomp
end

puts "=>Enter 's' to compute the sum, or 'p' to compute the product."
choice = gets.chomp.downcase

loop do
  if choice == 's'
    puts "The sum of all numbers, 1 to #{int}, is #{sum(int)}"
    break
  elsif choice == 'p'
    puts "The product of all numbers, 1 to #{int}, is #{product(int)}"
    break
  else
    next
  end
end
