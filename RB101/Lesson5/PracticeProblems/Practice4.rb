# For each of these collection objects where the calue 3 occurs, demonstrate how to change it to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

#using #puts to verify changes

puts arr1[1][1]
arr1[1][1] = 4
puts arr1[1][1]

puts arr2[2]
arr2[2] = 4
puts arr2[2]

puts hsh1[:first][2][0]
hsh1[:first][2][0] = 4
puts hsh1[:first][2][0]

puts hsh2[['a']][:a][2]
hsh2[['a']][:a][2] = 4
puts hsh2[['a']][:a][2]
