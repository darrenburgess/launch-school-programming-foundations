# rock_paper_scissors.rb

GAME_RULES = { rock:     { scissors: 'crushes',
                           lizard:   'crushes' },
               paper:    { rock:     'covers',
                           spock:    'disproves' },
               scissors: { paper:    'cuts',
                           lizard:   'decapitates' },
               lizard:   { paper:    'eats',
                           spock:    'poisons' },
               spock:    { rock:     'vaporizes',
                           scissors: 'smashes' }
            }.freeze

VALID_CHOICES = GAME_RULES.keys.join(',').split(',')

def prompt(message)
  puts "=> #{message}"
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice) || choice == 'exit'
end

def list_choices
  GAME_RULES.keys.join(', ')
end

def input_player_choice
  loop do
    choice = gets.chomp
    return choice if valid_choice?(choice)
    prompt("Choose #{list_choices}")
  end
end

def win?(first, second)
  GAME_RULES[first.to_sym][second.to_sym]
end

def determine_winner(player, computer)
  win = win?(player, computer)
  return "You win: #{player} #{win} #{computer}" if win

  win = win?(computer, player)
  return "Computer wins: #{computer} #{win} #{player}" if win

  "Tie!"
end

prompt("Welcome to #{list_choices}. You know what to do!")

loop do
  prompt("#{list_choices} GO!('exit' to stop)")
  player_choice = input_player_choice
  break if player_choice == 'exit'
  computer_choice = VALID_CHOICES.sample
  puts determine_winner(player_choice, computer_choice)
end
