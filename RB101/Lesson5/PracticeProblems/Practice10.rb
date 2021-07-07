# Given the following data structure and without modifying the original array
# use the map method to return a new array in structure but where the value of each
# integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |item|
  new_hash = {}
  item.each do |key, integer|
    new_hash[key] = integer + 1
  end
  new_hash
end
