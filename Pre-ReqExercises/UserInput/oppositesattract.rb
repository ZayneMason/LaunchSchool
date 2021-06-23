#Write a program that requests two integers from the user, adds them together, and then displays the result.
#Furthermore, insist that one of the integers be positive, and one negative;
#however, the order in which the two integers are entered does not matter.
#Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.
#You may use the following method to validate input integers:

#given method
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def evaluater
  loop do 
    puts "Please input a positive or negative number:"
    number = gets.chomp
    if valid_number?(number)
      return number
    else
      puts '>>Invalid number. Please make sure you are inputting non-zero numbers only.'
    end
  end
end

number1 = nil
number2 = nil

loop do 
  number1 = evaluater.to_i
  number2 = evaluater.to_i

  if number1 * number2 > 0
    puts '>>One number must be negative.'
    puts '>>Starting over.'
    next
  elsif number1 * number2 < 0
    break
  end
end 
sum = number1 + number2

puts "#{number1} + #{number2} = #{sum}"


  


