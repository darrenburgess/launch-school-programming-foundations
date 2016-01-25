# tic_tac_toe.rb

require 'pry'

PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "O".freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
WINNING_SCORE = 5
UNBEATABLE = true

def initialize_board
  { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " " }
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system 'clear'
end

# rubocop:disable Metrics/AbcSize
def display_board(b)
  clear_screen
  puts "     |   |   "
  puts "   #{b[1]} | #{b[2]} | #{b[3]} "
  puts "     |   |   "
  puts "  ---|---|---"
  puts "     |   |   "
  puts "   #{b[4]} | #{b[5]} | #{b[6]} "
  puts "     |   |   "
  puts "  ---|---|---"
  puts "     |   |   "
  puts "   #{b[7]} | #{b[8]} | #{b[9]} "
  puts "     |   |   "
end
# rubocop:enable Metrics/AbcSize

def update_board(board, choice, marker)
  board[choice.to_i] = marker
end

def remaining_choices(board)
  board.select { |_, v| v == " " }.keys
end

def joinor(array, delimiter, join_word = "or")
  if array.length > 1
    last_word = array.pop
    "#{array.join(delimiter)} #{join_word} #{last_word}"
  else
    array.join('')
  end
end

def display_choices(board)
  joinor(remaining_choices(board), ", ")
end

def player_choice(board)
  loop do
    puts "Make a choice: #{display_choices(board)}"
    choice = gets.chomp
    return choice if remaining_choices(board).include?(choice.to_i)
  end
end

def find_strategic_square(board, marker)
  WINNING_LINES.each do |line|
    if  board.values_at(*line).count(marker) == 2 &&
        board.values_at(*line).include?(' ')
      return line[board.values_at(*line).index(' ')]
    end
  end
  false
end

def computer_choice(board)
  if find_strategic_square(board, COMPUTER_MARKER)
    find_strategic_square(board, COMPUTER_MARKER)
  elsif find_strategic_square(board, PLAYER_MARKER)
    find_strategic_square(board, PLAYER_MARKER)
  elsif board[5] == ' '
    5
  elsif board[5] == 'X' && remaining_choices(board).length == 8 && UNBEATABLE
    [1, 3, 7, 9].sample
  else
    remaining_choices(board).sample
  end
end

def game_is_draw?(board)
  remaining_choices(board).empty?
end

def determine_winner?(board, marker)
  WINNING_LINES.each do |line|
    return true if board.values_at(*line).count(marker) == 3
  end
  false
end

def tally_score(winner, score)
  score[winner.to_sym] += 1
end

def over_all_winner(score)
  return "player" if score[:player] == WINNING_SCORE
  return "computer" if score[:computer] == WINNING_SCORE
end

def reset_score
  { player: 0, computer: 0 }
end

def play_game(board)
  loop do
    display_board(board)
    player = player_choice(board)
    update_board(board, player, PLAYER_MARKER)
    return "player" if determine_winner?(board, PLAYER_MARKER)

    computer = computer_choice(board)
    update_board(board, computer, COMPUTER_MARKER)
    display_board(board)
    return "computer" if determine_winner?(board, COMPUTER_MARKER)

    return "nobody" if game_is_draw?(board)
  end
end

score = reset_score

loop do
  board = initialize_board
  result = play_game(board)
  display_board(board)

  tally_score(result, score) unless result == "nobody"
  prompt("#{result.capitalize} won. Player: #{score[:player]} Computer: #{score[:computer]}")

  winner = over_all_winner(score)
  if winner
    prompt("#{winner.capitalize} wins the match!")
    score = reset_score
  end

  prompt("Play again? (y, n)")
  break if gets.chomp.downcase.start_with?('n')
end
