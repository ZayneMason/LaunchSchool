#Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.

count = 0

loop do
  count += 1
  if count.odd?
    puts "#{count} is odd."
  else
    puts "#{count} is even."
  end
  if count >= 5
    break
  end
end
