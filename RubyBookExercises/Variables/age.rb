=begin
  Write a program called age.rb that asks a user how old they are
  then tells them how old they will be in 10, 20, 30 and 40 years
  Example: 
    output of age.rb for someone 20 yrs old

    How old are you?
    In 10 years you will be:
    30
    In 20 years you will be:
    40
    In 30 years you will be:
    50
    In 40 years you will be:
    60
  
=end

puts "How old are you?"
age = gets.chomp.tp_i
puts "In 10 years you will be: "
puts age + 10
puts "In 20 years you will be:"
puts age + 20
puts "In 30 years you will be:"
puts age + 30
puts "In 40 years you will be:"
puts age + 40