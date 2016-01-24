# rock_paper_scissors.rb
# next: scrape rps 101 and build on config file with different versions
# http://umop.com/rps.htm
# http://readysteadycode.com/howto-scrape-websites-with-ruby-and-mechanize

GAME_RULES = {
  rock: {
    scissors: 'crushes',
    lizard: 'crushes' },
  paper: {
    rock: 'covers',
    spock: 'disproves' },
  scissors: {
    paper: 'cuts',
    lizard: 'decapitates' },
  lizard: {
    paper: 'eats',
    spock: 'poisons' },
  spock: {
    rock: 'vaporizes',
    scissors: 'smashes'
  }
}.freeze

VALID_CHOICES = GAME_RULES.keys.map(&:to_s)

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system 'clear'
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice) || choice == 'exit'
end

def list_choices
  VALID_CHOICES.join(', ')
end

def input_player_choice
  loop do
    choice = gets.chomp.downcase
    return choice if valid_choice?(choice)
    prompt("Choose #{list_choices}")
  end
end

def pause_play
  gets
end

def win?(first, second)
  GAME_RULES[first.to_sym][second.to_sym]
end

def determine_winner(player, computer)
  action = win?(player, computer)
  return "You win: #{player} #{action} #{computer}" if action

  action = win?(computer, player)
  return "Computer wins: #{computer} #{action} #{player}" if action

  "Tie!"
end

clear_screen
prompt("Welcome to #{list_choices}. You know what to do!")

loop do
  prompt("#{list_choices} GO!('exit' to stop)")
  player_choice = input_player_choice
  break if player_choice == 'exit'
  computer_choice = VALID_CHOICES.sample
  puts "#{determine_winner(player_choice, computer_choice)} (enter to continue)"
  pause_play
  clear_screen
end
