# Print all odd numbers from 1 to 99, inclusive, to the console, with each on a seperate line.

(1..99).to_a.each { |num| puts num if num.odd? }