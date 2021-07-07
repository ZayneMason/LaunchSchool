# Given this nested hash:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Find out the total age of just the male members of the family
male_age_sum = 0
munsters.each do |_, qualities|
  male_age_sum += qualities['age'] if qualities['gender'] == 'male'
end
puts male_age_sum

# Can refactor to use .each_value
