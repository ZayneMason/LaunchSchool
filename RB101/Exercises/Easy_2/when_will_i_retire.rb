# Build a program that displays when the user will retire and how many years
# they have to work until retirement.

def valid_number?(number)
  number.to_i.to_s == number
end

puts '=>What is your age?'
age = gets.chomp
loop do
  break if valid_number?(age)

  puts '=>Please enter a valid number.'
  age = gets.chomp
end

puts '=>What age do you want to retire?'
goal_age = gets.chomp
loop do
  break if valid_number?(goal_age)

  puts '=>Please enter a valid number.'
  goal_age = gets.chomp
end

years_left = goal_age.to_i - age.to_i
year_of = Time.now.year + years_left

puts "=>You will retire in #{year_of}. \n=>You need to work #{years_left} more years."
