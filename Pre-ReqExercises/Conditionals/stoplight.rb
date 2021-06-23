#In the code below, stoplight is randomly assigned as 'green', 'yellow', or 'red'.
stoplight = ['green', 'yellow' , 'red'].sample

#Write a case statement that prints "Go!" if stoplight equals 'green', "Slow down!" if stoplight equals 'yellow', and "Stop!" if stoplight equals 'red'.

case stoplight
when 'red'
  puts 'Stop!'
when 'yellow'
  puts 'Slow down!'
when 'green'
  puts 'Go!'
end

#convert the case statement to an if statement

if stoplight == 'red'
  puts 'Stop'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Go!'  
end