# How would you order this array of hashes based on the year of publication of each book, from
# earliest to latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! do |book|
  # we can use #sort_by to specify we want to only compare a specific value in each item
  book[:published]
end

puts books
