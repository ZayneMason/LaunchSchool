# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.
# 1 square meter == 10.7639 square feet
def valid_number?(number)
  number.to_i.to_s == number
end

def converter(int)
  int * 10.7639
end

def square_meters(lgth, wdth)
  lgth.to_f * wdth.to_f
end

loop do
  puts '=> Enter the length of room (meters):'
  length = gets.chomp
  loop do
    break if valid_number?(length)

    puts '=>Please enter a valid number'
    length = gets.chomp
  end

  puts '=> Enter the width of room (meters):'
  width = gets.chomp
  loop do
    break if valid_number?(width)

    puts '=>Please enter a valid number'
    width = gets.chomp
  end

  puts "=>The area of the room is #{square_meters(length, width)} square meters
  (#{converter(square_meters(length, width))} square feet)."

  puts '=> Would you like to measure another room? (y/n)'
  decision = gets.chomp.downcase
  decision == 'y' ? next : break
end
