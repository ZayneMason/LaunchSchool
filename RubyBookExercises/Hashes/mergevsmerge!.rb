#Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? 
#Write a program that uses both and illustrate the differences.

h1 = {1=>1, 2=>2, 3=>3}
h2 = {1=>2, 2=>3, 3=>4, 4=>5}

p h1.merge(h2)
p h1
p h1.merge!(h2)
p h1
