# rock_paper_scissors.rb
# next: scrape rps 101 and build on config file with different versions
# http://umop.com/rps.htm
# http://readysteadycode.com/howto-scrape-websites-with-ruby-and-mechanize

require './rps_rules.rb'
require 'pry'

GAME_TYPE_CHOICES = GAME_RULES.keys.map(&:to_s)

def get_user_game_choice
  choice = ""
  loop do
    prompt "Choose from the following RPS games: #{GAME_TYPE_CHOICES}"
    choice = gets.chomp
    break if GAME_TYPE_CHOICES.include?(choice)
  end
  choice
end

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
  RULES[first.to_sym][second.to_sym]
end

def determine_winner(player, computer)
  action = win?(player, computer)
  return "You win: #{player} #{action} #{computer}" if action

  action = win?(computer, player)
  return "Computer wins: #{computer} #{action} #{player}" if action

  "Tie!"
end

clear_screen

game_type = get_user_game_choice
VALID_CHOICES = GAME_RULES[game_type].keys.map(&:to_s)
RULES = GAME_RULES[game_type]

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
