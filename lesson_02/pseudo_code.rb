# 1. a method that returns the sum of two integers
# 
# Casual:
# Ask the user for the first integer
# Ask the user for the second integer
# calculate the sum of the first and second integers
# print the result
#
# Formal:
# START
#   PRINT 'enter first number'
#   SET a = user input, converted to integer
#   PRINT 'enter second number'
#   SET b = user input, converted to integer
#   SET result = a + b
#   PRINT result
# END

def add_two_numbers
  puts "enter first number"
  a = gets.chomp.to_i
  puts "enter second number"
  b = gets.chomp.to_i
  result = a + b
  puts "#{a} + #{b} = #{result}"
end

add_two_numbers

# 2. a method that takes an array of strings, and 
# returns a string that is all those strings concatenated together
# 
# Casual:
# Set a variable to the array of strings
# Call the method with the array as an argument
# Loop over the array, exiting the loop after the last value
# Each iteration, concatinating each value onto a new variable
#
# Formal:
# START
#   SET a = ['asdf','dfgh','qwer']
#   SET iterator = 0
#   SET string_result = ""
#   WHILE iterator < length of array
#     SET string_result = string_result + a[iterator]
#     SET interator + 1
#   END
# END
#    

def array_to_string(arr)
  str = ""
  arr.each do |a|
    str = str + a.chomp
  end
  return str
end

input = ['qwer','asdf','zxcv']
result = array_to_string(input)

puts result

# 3. a method that takes an array of integers, 
# and returns a new array with every other element
#
# Casual:
# create an array of numbers
# loop the array
#   if the index of the item is even, add the number to a new array
# end loop
# print the result
#
# Formal:
#
# START
#   SET a = array of numbers
#   LOOP array
#     IF index % 2 = 0
#       SET new_array => push value of array
#     END
#   END
#   PRINT new_array

array = [1,2,3,4,5,6,7,8,9,10]

new_array = array.select.with_index { |_,i| i.even? }

puts new_array.inspect

