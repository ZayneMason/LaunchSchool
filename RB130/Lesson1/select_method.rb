# The Array#select method takes a block and yields each element in the calling object to it. If the block
# evaluates to true, the element is included in an array returned by the method.

def select(arr)
  selected_items = []
  counter = 0
  until counter == arr.max
    selected_items << arr[counter] if yield(arr[counter])
    counter += 1
  end

  selected_items
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true