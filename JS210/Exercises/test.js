let array = [1,2,3,4];
console.log(array.length); // 4

array['fortnite'] = 'awesome';
console.log(array.length); // 4

array.forEach((element) => console.log(element)); // 1 2 3 4
for (let prop in array) {
  console.log(array[prop]); // 1 2 3 4 awesome
}

console.log(array['fortnite']); // awesome