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

def display_winner(player, computer)
  scissors = 'scissors'
  rock = 'rock'
  paper = 'paper'
  if    (player == scissors && computer == paper) ||
        (player == rock     && computer == scissors) ||
        (player == paper    && computer == rock)
    prompt("You win: #{player} beats #{computer}")
  elsif (computer == scissors && player == paper) ||
        (computer == rock     && player == scissors) ||
        (computer == paper    && player == rock)
    prompt("Computer wins: #{computer} beats #{player}")
  else
    prompt("Tie")
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
