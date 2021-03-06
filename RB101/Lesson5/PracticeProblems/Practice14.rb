# Given this data structure, write some code to return an array contatining the colors
# of the fruits and the sizes of vegetables.
# The sizes should be uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# The return values should look like this [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh.map do |_, v|
  if v[:type] == 'fruit'
    v[:colors].map do |color|
      color.capitalize
    end
  elsif v[:type] == 'vegetable'
    v[:size].upcase
  end
end

