# question 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# question 2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino' # shovel operator mutates the caller

# question 3
flintstones.pop  # pop mutates the caller
flintstones.push('Dino','Hoppy') # push mutates the caller

# question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house')

# question 5
statement = "The Flintstones Rock!"
statement.count "t"
statement.scan('t').count

#question 6
title = "Flintstone Family Members"
title = " " * (40 - title.length) + title
title.center(40) # "       Flintstone Family Members        " 



