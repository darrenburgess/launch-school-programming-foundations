# command line calculator

puts "Enter first number"
a = gets.chomp.to_i

puts "Enter second number"
b = gets.chomp.to_i

puts "Select an operator (*, /, +, -)"
op = gets.chomp

result = if op == "*"
           a * b
         elsif op == "/"
           a / b.to_f
         elsif op == "+"
           a + b
         elsif op == "-"
           a - b
         else
           "error"
         end

if op != "error"
  puts "#{a.to_s + op + b.to_s} + '=' + #{result}"
else
  puts "an error occurred"
end

