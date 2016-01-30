# black_jack.rb

require 'pry'

CARD_TYPES = ["2", "3", "4", "5", "6", "7", "8", "9", "10"] +
             ["Jack", "Queen", "King", "Ace"].freeze
SUITS = ["Hearts", "Clubs", "Diamonds", "Spades"].freeze

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system 'clear' or system 'cls'
end

def display_cards(hands, hide_dealer)
  hands.each do |player, cards|
    puts("#{player.upcase}'S CARDS:")
    cards.each do |card|
      if player == :dealer && hide_dealer
        prompt("Hidden")
        hide_dealer = false
      else
        card = card.join(" of ")
        prompt(card)
      end
    end
    puts("\n")
  end
end

def initialize_deck
  CARD_TYPES.product(SUITS).shuffle
end

def draw_card(deck)
  deck.pop
end

def deal_initial_hands(deck,hands)
    2.times do
      player_hit(hands, :player, deck)
      player_hit(hands, :dealer, deck)
    end
end

def player_hit(hands, player, deck)
  hands[player].push(draw_card(deck))
end

def player_get_input
  input = ""
  loop do
    prompt("(H)it or (S)tick")
    input = gets.chomp.downcase
    break if %w(hit stick).include? input
  end
  input
end

def card_value(card)
  case card
  when "Jack", "Queen", "King"
    10
  when "Ace"
    11
  else
    card.to_i
  end
end

def calculate_hand(hands, player)
  cards = hands[player]
  total = 0
  cards.each do |card|
    value = card_value(card[0])
    total += value
  end
  ace_value = cards.flatten.count("Ace") * 10
  if total > 21
    total -= ace_value
  else
    total
  end
end

def player_busted?(result)
  result > 21
end

def determine_winner(hands)
  # evaluate the hands object to deterimine winner
end

def player_turn(hands, deck)
  result = calculate_hand(hands, :player)
  loop do
    display_cards(hands, true)
    choice = player_get_input
    break if choice.downcase.start_with?("s")
    player_hit(hands, :player, deck)
    result = calculate_hand(hands, :player)
    break if result > 21
  end
  result
end

def dealer_turn(hands, deck)
  result = 0
  loop do
    result = calculate_hand(hands, :dealer)
    break if result > 21 || result >= 17
    player_hit(hands, :dealer, deck)
  end
  result
end

def display_busted(player, result)
  prompt("#{player} busted!")
  prompt("Card total: #{result}")
end

def display_final_result(result_player, result_dealer)
  prompt("Player score: #{result_player}")
  prompt("Dealer score: #{result_dealer}")
  if result_player > 21 && result_dealer > 21
    prompt("Both players busted, no winner")
  elsif result_player > 21
    prompt("Player busted, Dealer wins")
  elsif result_dealer > 21
    prompt("Dealer busted, Player wins")
  elsif result_player > result_dealer
    prompt("Player wins")
  else
    prompt("Dealer wins")
  end
end

def play_again?
  prompt("Play again (y,n)")
  gets.chomp.downcase[0]
end

loop do
  clear_screen
  hands = { :player => [], :dealer => []}
  deck = initialize_deck
  deal_initial_hands(deck, hands)

  result_player = player_turn(hands, deck)
  if player_busted?(result_player)
    display_busted("Player", result_player)
  end

  if result_player <= 21
    result_dealer = dealer_turn(hands, deck)
    if player_busted?(result_dealer)
      display_busted("Dealer", result_dealer)
    end
  else
    result_dealer = calculate_hand(hands, :dealer)
  end

  display_cards(hands, false)
  display_final_result(result_player, result_dealer)

  break if play_again? == 'n'
end
