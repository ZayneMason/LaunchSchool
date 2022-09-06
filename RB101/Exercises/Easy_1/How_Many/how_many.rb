# Write a method that counts the number of occurrencces of each element in a given array:

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# The words in the array are case-sensitive. Once counted, print each element alongside the
# number of occurences
# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurences(arr)
  vehicle_count = {}

  arr.uniq.each { |vehicle| vehicle_count[vehicle] = arr.count(vehicle) }
  vehicle_count.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

count_occurences(vehicles)
