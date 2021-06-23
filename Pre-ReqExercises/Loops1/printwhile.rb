#Using a wwhile loop, print 5 numbers between 0 and 99

numbers = []



while numbers.size < 5
  numbers << rand(100) 
end

numbers.each do |num|
  p num
end


