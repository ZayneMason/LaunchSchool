# Write a method that displats a 4 pointed diamond in an n x n grid where n is an odd integer that is
# supplied as an argument to the method. You may assume the argument will always be odd.

def print_row(n, distance)
  number_of_stars = n - 2 * distance
  stars = '*' * number_of_stars
  puts stars.center(n)
end

def diamond(n)
  max_distance = (n - 1) / 2
  max_distance.downto(0) { |distance| print_row(n, distance) }
  1.upto(max_distance)   { |distance| print_row(n, distance) }
end

diamond(99)
