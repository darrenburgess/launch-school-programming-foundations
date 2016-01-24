# -*- immutable: string -*-

require 'pry'

PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "O".freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

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

def computer_choice(board)
  remaining_choices(board).sample
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

def play_game(board)
  loop do
    display_board(board)
    player = player_choice(board)
    update_board(board, player, PLAYER_MARKER)
    return "Player" if determine_winner?(board, PLAYER_MARKER)

    computer = computer_choice(board)
    update_board(board, computer, COMPUTER_MARKER)
    display_board(board)
    return "Computer" if determine_winner?(board, COMPUTER_MARKER)

    return "Nobody" if game_is_draw?(board)
  end
end

loop do
  board = initialize_board
  result = play_game(board)
  display_board(board)
  prompt("#{result} won.  Play again? (y, n)")
  break if gets.chomp.downcase.start_with?('n')
end
