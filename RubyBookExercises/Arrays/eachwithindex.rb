#Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

myarray = [1, 2, 3, 4, 5, 6]
myarray.each_with_index {|val,ind| puts "value:#{val} is indexed at #{ind}"}