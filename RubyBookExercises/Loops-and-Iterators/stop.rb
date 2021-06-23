#Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

usrinput = ""
while usrinput != "STOP"
  puts "you done yet? type STOP."
  usrinput = gets.chomp
end
