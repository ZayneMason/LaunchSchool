# Write a method that takes a year as input and returns the century. The return value should be a string that
# begins with the century number, and ends with the appropriate suffix.
# Centuries start at 01, not 00.

def century(year)
  if year % 100 == 0
    century = (year / 100)
  else
    century = (year / 100) + 1
  end
  century_str = century.to_s
  century_str + suffix(century)
end

def suffix(century)
  return 'th' if (11..13).to_a.include?(century % 100)

  case century % 10
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

# Tests:
puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
