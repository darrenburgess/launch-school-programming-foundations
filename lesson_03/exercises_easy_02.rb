# question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
if ages['Spot']
  puts "Spot is #{ages['Spot']}"
else
  puts "there is no spot"
end
ages.key?('Spot')   # .include?('Spot')   or    .member?('Spot')

# question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = ages.values.inject(:+)


# question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages_young = {}
ages.each do |name, age|
  if age < 100
    ages_young[name] = age
  end
end

  # or 
ages.keep_if { |name, age| age < 100 }

# question 4
munsters_description = "The Munsters are creepy in a good way."

# "The munsters are creepy in a good way."
munsters_description.downcase.capitalize
munsters_description.capitalize  # down case is not necessary as captialize will force downcase on rest of string
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase
# "the munsters are creepy in a good way."
munsters_description.downcase
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase

# question 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge(additional_ages)
ages.merge!(additional_ages)   # mutates caller

# question 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

# question 7
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")  # false but not quite right. regex is better
advice.match("Dino")   # or
advice =~ /Dino/     # returns the position

# question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name[0,2] == "Be" }

# question 9 Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }

# question 10
flintstones.map! { |name| name[0, 3] }
