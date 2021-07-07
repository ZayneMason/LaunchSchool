# Using the #each method, write some code to ouput all the vowels from the strings
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

def vowel_output(hash)
  vowels = []
  vowel_list = %w(a e i o u A E I O U)
  hash.each do |_, word_arr|
    word_arr.each do |words|
      words.chars.each do |letter|
        vowels << letter if vowel_list.include?(letter)
      end
    end
  end
  vowels
end

puts vowel_output(hsh)