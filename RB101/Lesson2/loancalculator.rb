def valid_number?(number)
  number.to_i.to_s == number
end

def valid_float?(number)
  number.to_f.to_s == number
end

loop do
  puts '=>Hello! Welcome to interest the mortage/car loan calculator!'
  loan_amount = ''
  loop do
    puts '=>Please input your loan amount.'
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      puts '=>Please enter a valid number.'
    end
  end

  loan_duration = ''
  loop do
    puts '=> Please input your loan duration. (months)'
    loan_duration = gets.chomp

    if valid_number?(loan_duration)
      break
    else
      puts '=>Please enter a valid number.'
    end
  end

  interest = ''
  loop do
    puts '=> Please input your interest rate. Do not include percent.'
    puts '=> Example: 5 for 5% , 2.5 for 2.5%'
    interest = gets.chomp
    if valid_float?(interest) || valid_number?(interest)
      interest = interest.to_f / 100
      break
    else      puts '=> Please input a valid number.'
    end
  end
  monthly_interest = interest / 12
  payment = loan_amount.to_f() * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration.to_f)))

  puts "=> Your monthly payment will be: #{format('%.2f' , payment)}"

  puts '=> Would you like to calculate another loan? (y/n)'
  decision = gets.chomp
  case decision.downcase
  when 'y'
    next
  when 'n'
    break
  end
end
