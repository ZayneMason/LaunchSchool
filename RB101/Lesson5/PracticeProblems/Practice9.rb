# Given this data structure, return a new array of the same structre, but with
# sub arrays being ordered (alphabetically or numberically) decending.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |array|
  array.sort do |a, b|
    b <=> a
  end
end
