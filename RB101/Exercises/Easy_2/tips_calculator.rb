# Create a simple tip calculator. The program should prompt for a bill and a tip rate.
# The program must compute the tip and then display both the tip and the total amount of the bill.

def tip_percent(percentage)
  percentage.to_f / 100
end

def total(sub_total, tip)
  sub_total.to_f + (sub_total.to_f * tip)
end

def valid_number?(number)
  number.to_f.to_s == number
end

loop do
  puts '=> What is the bill? (Place a decimal even if total is a whole number)'
  bill = gets.chomp
  loop do
    break if valid_number?(bill)

    puts '=>Please enter a valid number.'
    bill = gets.chomp
  end
  puts '=>What percent do you want to tip? (5.0, 10.0, 15.0...)'
  tip_perc = gets.chomp
  loop do
    break if valid_number?(tip_perc)

    puts '=>Please enter a valid number.'
    tip_perc = gets.chomp
  end

  percent = tip_percent(tip_perc)
  total_bill = total(bill.to_f, percent).round(2)
  just_tip = (bill.to_f * percent).round(2)

  puts "=>The tip is: #{just_tip} \n=>The total is: #{total_bill}"

  puts '=> Would you like to calculate another bill? (y/n)'
  decision = gets.chomp.downcase
  decision == 'y' ? next : break
end
