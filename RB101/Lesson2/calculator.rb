# Build a command line calculator program that does the following:
# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply,or divide
# display the result

def valid_number?(number)
  number.to_i.to_s == number
end

def user_message(message)
  puts("=> #{message}")
end

loop do
  num_one = ''
  loop do
    user_message('Please input number one.')
    num_one = Kernel.gets.chomp

    if valid_number?(num_one)
      break
    else
      puts 'Please enter a valid number.'
    end
  end

  num_two = ''
  loop do
    user_message('Please input number two.')
    num_two = Kernel.gets.chomp

    if valid_number?(num_two)
      break
    else
      puts 'Please enter a valid number.'
    end
  end

  user_message("Please choose an operation.\n --A for addition\n --S for subtraction\n --M for multiplication\n --D for division")
  loop do
    operation = Kernel.gets.chomp.to_s.downcase
    if %w(a d s m).include?(operation)
      break
    else
      user_message('Please choose a valid operation.')
    end
  end

  result = case operation
           when 'a'
             num_one + num_two
           when 's'
             num_one - num_two
           when 'm'
             num_one * num_two
           when 'd'
             num_one.to_f / num_two
           end
  user_message('Calculating...')
  user_message(result)
  user_message('Would you like to do it again? (y/n)')

  decision = ''
  loop do
    decision = gets.chomp
    if decision == 'y'
      break
    elsif decision == 'n'
      decision = false
    else
      user_message('Please make sure you input (y/n)')
    end
  end
  break if decision == false
end
