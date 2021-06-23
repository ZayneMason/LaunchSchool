#Write a program that asks the user for their age in years, and then converts that age to months.

puts "How many years old are you? (round)"

answer = gets.chomp.to_i
months = answer * 12

puts "If you are #{answer} years old, then you are about #{months} months old!"