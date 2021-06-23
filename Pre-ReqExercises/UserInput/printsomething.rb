#Write a program that asks the user whether they want the program to print "something", then print it if the user enters y. If n don't print. Check for valid choice.
loop do
  
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase
  puts 'something' if answer == "y"
  break if %w(y n).include?(answer)
  puts '>>Invalid response! Please'
end



