# Given the munsters hash below 
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each memeber of the munster family has an additional "age_group" key that
# has one of three values describing the age group the family member is in (kid, adult, or senior).
# A kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters.each do |_name, categories|
  categories.keys << 'age_group'
  if categories['age'] <= 17
    categories['age_group'] = 'kid'
  elsif categories['age'] > 17 && categories['age'] <= 64
    categories['age_group'] = 'adult'
  elsif categories['age'] >= 65
    categories['age_group'] = 'senior'
  end
end
puts munsters

# Can also use case method and ranges
