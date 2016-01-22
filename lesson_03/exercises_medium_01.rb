# question 1
10.times { |x| puts " " * x + "The Flintstones Rock!"}

# question 2
# Create a hash that expresses the frequency 
# with which each letter occurs in this string.
# ie { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
statement = "The Flintstones Rock"
hash = {}
statement.split('').each do |char|
  if char =~ /[A-Za-z]/
    hash[char] = statement.scan(char).count if !hash[char]
  end
end

puts hash 

# question 3 
# the statement is attempting to add a concatinate a number to a string
# TypeError: no implicit conversion of Fixnum into String
# use string interpolation
# or convert the number to a string
puts "the value of 40 + 2 is #{40+2}"
puts "the value of 40 + 2 is " + (40+2).to_s

# question 4
# shift
# output => 1   3
# numbers [ 3, 4 ]
# pop:
# output => 1   2
# numbers [ 1, 2 ]

# question 5
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -=1
  end until dividend == 0
  divisors
end

def factors(number)
  dividend = number
  divisors = []
    while dividend > 0 
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
  divisors
end

puts factors(10)

# question 6
# I would prefer the first as it passes in the existing
# buffer and then mutates it.  Code is more consise

# question 7
# to fix this I would add limit as an argument in the function
# def fib(first_num, second_num, limit)

# question 8
title = "the quick brown fox jumped over the laze dog"
puts title.split.map { |word| word.capitalize }.join(' ')

# question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

























