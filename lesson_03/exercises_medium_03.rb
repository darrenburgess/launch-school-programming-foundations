# question 3
# my_string = pumpkins - the method does not mutate the caller 
# # my_array = ["pumpkins", "rutabaga"]  - the method will mutate the caller

# question 5
def color_valid(color)
   if ["blue","green"].include?(color) 
    true
  else
    false
  end
end

puts color_valid("blue")
puts color_valid("red")

def color_valid2(color)
  ["blue","gree"].include?(color)
end


