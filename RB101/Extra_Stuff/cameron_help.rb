def fix(value)
  value.upcase!
  value.concat('!')
  value 
end 
​
s = 'hello'
t = fix(s)
​
p s 
p t 
​
# What does the following code return? What does it output? Why? What concept does
# it demonstrate
​
# After running the code the method call `fix('hello')` returns `'HELLO!'`. `puts(s)`` outputs `HELLO!`
# and `puts t` also outputs `HELLO!`
​
# On line 7 variable `s` is initialized and assigned to the string object `hello`.
# The method `fix` is called on `line 8` and passed the string object `hello` referenced by variable `s`.
​
# Within the method, the variable `value` now points to the string object `'hello'`.
# On line 2 of the method `upcase!` is called on `value` which mutates the value variable `value` 
# points to and upcases its letters. Variable `s` and variable `value` now point to string object 
#  `'HELLO'`
# On line 3 method `concat` is invoked on variable `value` and passed the string object `!`
#  which concatenates `!` to the end of the variable `value`. `concat` mutates the value variable 
# `value` and variable `s` points to. These two variables now point to string object `HELLO!`
# On line 4 variable `value` evaluates to `HELLO!` which is implicitly returned.
​
# This code sample demonstrates that an object passed to a method can be mutated within that method.
​
​###########################################

# Perfect.

###########################################

array = [1, 2, 3, 4, 5]
​
array.select do |num| 
  puts num if num.odd?
end
​
# What does the following code return? What does it output? Why? What concept does it demonstrate?
​
# The following code returns an empty array and outputs integer objects `1`, `3`, and `5`. 
​
# An empty array is returned because the select method places the object it is iterating over in the
# returned array  only if the return value of the block is truthy. Nil is the evaluated result of the last 
# line in the block for all 5 objects, and nil evaluates to false in a boolean context, so an empty array
# is returned.
​
# Integer objects `1`, `3`, and `5` are output because the integer object being iterated over is output
# when num.odd? evaluates to true.  
​
# This concept demonstrates that the select method only places the object it is iterating over in the
# returned array if the return value of the block is truthy, and in this code sample it never is.

#################################

# This is a great answer. However, they would want you to go into more depth on how the select method works.
# For example, what is |num| and what is it referencing in the block?
# Why specifically does the block evaluate to nil?
# For the concepts, they usually mean something abstract. For example, the term variable shadowing. In this case I would say
# it demonstrates side effects vs returns and explain why the result may be unexpected and how to fix it.
# This seems redundantly obvious, but I would also explain what num.odd? is checking for each number explicitly.
# For example, num.odd? evaluates as true for 1, 3, and 5 because...

################################

words = %w(jump trip laugh run talk)
​
new_array = words.map do |word|
  word.start_with?("t")
end
​
p new_array
​
# What does the following code return? What does it output? 
# Why? What concept does it demonstrate?
​
# The following code returns and outputs the array `[false, true, false, false, true]`
​
# An array of booleans is returned because the `String#start_with?(str)` 
# method returns a boolean value,
# and the `map` method places the return value of the block 
# passed to it in the array `map` returns.
​
# The code sample demonstrates the concept that the `map` method is a transformative method. The
# values in the array returned from invoking the `map` method are the result of the return value
# of the block passed to the `map` method.

##############################

# Another very strong answer, however similary to the select example, I would go into a more detailed explanation of the code.
# I would explain in a little more depth what is going on inside the map block (parameter, what is being iterated over, etc.)
# Although it is implied, I would specifically mention that the return of map is a completely new array.
# Optionally, I would also mention how select could be used to achieve the implied results the code "wants" to achieve, and why.

##############################

# The map method invoked on words, is passed a do..end block with a parameter word. Word references the element in the array
# being iterated over.