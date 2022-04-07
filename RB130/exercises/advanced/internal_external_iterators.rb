factorial = Enumerator.new do |y|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    y << accumulator
    number += 1
  end
end

# External iterators
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Externally iterating on the enumerator does not allow it to reset, and it continues to iterate on it's previous stopping point
# when we call Enumerator#next. To reset the iteration, we can call Enumerator#rewind.
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators
# Internal/built-in iteration methods automatically 'rewinds' iteration.
factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  # The enumerator is infinite so we must explicitally break.
  break if number >= 5
end