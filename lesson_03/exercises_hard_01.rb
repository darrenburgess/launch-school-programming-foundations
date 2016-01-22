# question 1
if false
  greeting = "hello world"
end

greeting # => nil.  Did not throw an exception.  This is because the variable is
         # initialized in the if block even though the block does not execute

# question 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting # => "hi there"
puts greetings # => { a: 'hi' }  in this case the original variable is not modified
               # informal_greeting points to a new space in memory
               # and so its transformation does not affect the original
               # but I was wrong as I assumed that greetings[:a] referred to the 
               # value and not to the original object

# question 3a
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

# assingment in the function will not mutate the caller
# also, the params are local to the method
puts "one is: #{one}"     # => "one" 
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

# question 3b
def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

# again, simple assigment will not mutate the outside variables
puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

# question 3c
def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

# gsub! will mutate the caller
puts "one is: #{one}"     # => "two"
puts "two is: #{two}"     # => "three"
puts "three is: #{three}" # => "one"

# question 4
# write a UUID method
def uuid
  time = Time.now.to_i.to_s(16)
  second = rand(10000..99999).to_s(16)
  third  = rand(10000..99999).to_s(16)
  fourth = rand(10000..99999).to_s(16)
  fifth  = rand(10000000000000..99999999999999).to_s(16)

  "#{time}-#{second}-#{third}-#{fourth}-#{fifth}"
end

puts uuid

# question 5

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  
  dot_separated_words.each do |word|
    return false if word.to_i.to_s != word
  end

  return true
end

puts dot_separated_ip_address?("192.168.1.1")
