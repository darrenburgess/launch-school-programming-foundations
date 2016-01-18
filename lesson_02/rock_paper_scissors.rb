# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  puts "=> #{message}"
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice)
end

def list_choices
  VALID_CHOICES.join(', ')
end

def input_player_choice
  loop do
    prompt("#{list_choices} GO!")
    choice = gets.chomp
    return choice if valid_choice?(choice)
    prompt("Choose #{list_choices}")
  end
end

def play_again?
  prompt('Play again?')
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def win?(first, second)
 (first == 'scissors' && second == 'paper') ||
 (first == 'rock'     && second == 'scissors') ||
 (first == 'paper'    && second == 'rock')
end

def display_winner(player, computer)
  if win?(player, computer)
    prompt("You win: #{player} beats #{computer}")
  elsif win?(computer, player) 
    prompt("Computer wins: #{computer} beats #{player}")
  else
    prompt("Tie!")
  end
end

prompt("Welcome to #{list_choices}. You know what to do!")

loop do
  prompt("Make a choice:")
  player_choice = input_player_choice
  computer_choice = VALID_CHOICES.sample
  display_winner(player_choice, computer_choice)
  break unless play_again?
end
