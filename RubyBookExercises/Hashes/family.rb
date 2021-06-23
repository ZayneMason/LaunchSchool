=begin
Given a hash of family members, with keys as the title and an array of names as the values,
use Ruby's built-in select method to gather only immediate family members' names into a new array.
=end

#given hash
family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}
direct_family = family.select do |relation , members|
  relation == :brothers || relation == :sisters
end

directarr = direct_family.values.flatten
p directarr
