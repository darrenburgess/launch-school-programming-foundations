# question 1
numbers = [1,2,2,3]
numbers.uniq

puts numbers # [1,2,2,3]  uniq will not mutuate

# question 2
#
# ! means not in the context of conditionals 
# != reads 'not equal to'
# ! and ? are just part of method name. ! implies mutation. ? implies boolean return
# ? is also used in the ternary operator as the 'else'
# !! could be read as 'not not', changing the object into its boolean equivalent

# question 3
advice = "Few things in life are as important as house training your pet dinosaur"
advice.sub!('important', 'urgent') # use sub! to mutate the caller  
puts advice

# question 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # removes item at index 1. mutates caller
numbers.delete(1) # removes item(s) = 1. mutates caller

# question 5
puts (10..100) === 42  # true
puts (10..100).include(42) # true

# question 6
famous_words = "seven years ago..."
solution_1 = "Four score and " << famous_words
solution_2 = "Four Score and " + famous_words

# question 7
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"

5.times { how_deep.gsub!("number", "add_eight(number)") }

puts eval(how_deep) # 42

# question 8
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
puts flintstones.assoc("Barney")

# question 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_hash = {}
flintstones.each_with_index do |n,i|
  flint_hash[n] = 1
end
puts flint_hash
