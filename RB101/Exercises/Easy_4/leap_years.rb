# Leap years accur in every year that is divisible by 4, unless the year is also divisible by 100, then it is not a leap year
# unless the year is evenly divisible by 400. Write a method that takes any year greater than 0 as an input, and returns true
# or false depending on if that year is, or is not, a leap year.

def by_4?(num)
  num % 4 == 0
end

def by_100?(num)
  num % 100 == 0
end

def by_400?(num)
  num % 400 == 0
end

def leap_year?(year)
  by_400?(year) || (by_100?(year) == false && by_4?(year)) ? true : false
end

puts(leap_year?(2016) == true)
puts(leap_year?(2015) == false)
puts(leap_year?(2100) == false)
puts(leap_year?(2400) == true)
puts(leap_year?(240000) == true)
puts(leap_year?(240001) == false)
puts(leap_year?(2000) == true)
puts(leap_year?(1900) == false)
puts(leap_year?(1752) == true)
puts(leap_year?(1700) == false)
puts(leap_year?(1) == false)
puts(leap_year?(100) == false)
puts(leap_year?(400) == true)
