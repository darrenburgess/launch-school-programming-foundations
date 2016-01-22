# question 1
munsters = {}
total_age = 0
munsters.each do |munster, details|
  total_age += details["age"] if details["gender"] == "male"
end

# question 2
munsters.each do |munster, details|
  puts "#{munster} is a #{details["age"]} year old #{details["gender"]}"
end

# question 3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# question 4
sentence = "Humpty Dumpty sat on a wall"
puts sentence.split.reverse.join(' ')

# question 5
34 # the initial variable answer is not mutated in the function.

# question 6
# yes, the original hash is mutated because the actual hash
# is passed to the method.  the object is identified by id 
# and this exact object is the one acted on in the method

# question 7
# resolve the methods from the inside out
# 1. rps(rps( paper  , rock ), rock)
# 2. rps(paper, rock)
# 3. paper

# question 8
# returns 'no'
# method foo will always return "yes" as that is the last
# expression in the method and so is returned implicitly.
# bar(foo) then pass "yes" into the bar method
# since a param is passed, we will not use the default
# parameter of "no" for the foo method
# therefore the ternary statement will be equivalent to
# "yes" == "no" ? "yes" : "no"  # evaluates to false
