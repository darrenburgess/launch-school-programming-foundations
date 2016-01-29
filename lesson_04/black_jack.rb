# black_jack.rb

require 'pry'

CARD_TYPES = ["2", "3", "4", "5", "6", "7", "8", "9", "10"] + 
             ["Jack", "Queen", "King", "Ace"]
SUITS = ["Hearts", "Clubs", "Diamonds", "Spades"]

current_deck = []

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system 'clear'
end

def display_cards(hands, hide_dealer)
  hands.each do |player, cards|
    puts("#{player.upcase}'S CARDS:")
    cards.each do |card|
      if player == :Dealer && hide_dealer
        prompt("Hidden")
        hide_dealer = false
      else  
        card = card.join( " of " )
        prompt("#{card}")
      end
    end
    puts("\n")
  end
end

def initialize_deck(deck)
  CARD_TYPES.each do |card_type|
    SUITS.each do |suit|
      deck << [card_type, suit]
    end
  end
end

def shuffle_deck(deck)
  size = deck.size
  new_deck = []
  until size == 0 do
    selected_card = deck.delete_at(rand(0..(size - 1)))
    new_deck << selected_card
    size -= 1
  end
  new_deck
end

def draw_card(deck)
  deck.pop
end

def deal_initial_hands(deck, hands)
  [:Player, :Dealer].each do |player|
    hands[player] = []
    2.times do |t|
      hands[player] += [draw_card(deck)]
    end
  end
end

def player_hit(hands, player, deck)
  hands[player].push(draw_card(deck))
end

def shuffle_deck_if_needed(deck)
  if deck.size = 0
    initialize_deck(deck)
    shuffle_deck(deck)
  end
end

def player_get_input
  input = ""
  loop do
    prompt("Hit or Stick")
    input = gets.chomp.downcase
    break if %(hit stick).include? input
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
    total = total + value
  end
  total
end

def player_busted?(result)
  true if result > 21
end

def determine_winner(hands)
  # evaluate the hands object to deterimine winner
end

def player_loop(hands, deck)
  result = calculate_hand(hands, :Player)
  loop do
    display_cards(hands, true)
    choice = player_get_input
    break if choice == "stick"
    player_hit(hands, :Player, deck)
    result = calculate_hand(hands, :Player)
    break if result > 21
  end
  result
end

def dealer_loop(hands, deck)
  result = 0
  loop do
    result = calculate_hand(hands, :Dealer)
    break if result > 21 or result >= 17
    player_hit(hands, :Dealer, deck)
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

def game_loop
  hands = {}
  loop do
    clear_screen
    current_deck = []
    hands = {}
    initialize_deck(current_deck)
    deck = shuffle_deck(current_deck)
    deal_initial_hands(deck, hands)

    result_player = player_loop(hands, deck)
    if player_busted?(result_player)
      display_busted("Player", result_player)
    end

    if result_player <= 21
      result_dealer = dealer_loop(hands, deck)
      if player_busted?(result_dealer)
        display_busted("Dealer", result_dealer)
      end
    else
      result_dealer = calculate_hand(hands, :Dealer)
    end
    
    display_cards(hands, false)
    display_final_result(result_player, result_dealer)

    break if play_again? == 'n'
  end
end

game_loop
