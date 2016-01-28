# black_jack.rb

require 'pry'

CARD_TYPES = ["2", "3", "4", "5", "6", "7", "8", "9", "10"] + 
             ["Jack", "Queen", "King", "Ace"]
SUITS = ["Hearts", "Clubs", "Diamonds", "Spades"]

current_deck = []
hide_dealer = true

hands = {
  # Darren: [["Ace", "Spades"], ["Jack", "Spades"]],
  # Dealer: [["3", "Diamonds"], ["Queen", "Diamonds"]]
}

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

def computer_hit_stick(hand)
  # calculate if the computer should hit or stick
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

def determine_winner(hands)
  # evaluate the hands object to deterimine winner
end

def display_result
  # display a result object
end

def clear_result(hand_result)
  # clear the result object
end

def player_loop(hands, deck, hide_dealer)
  result = 0
  loop do
    display_cards(hands, hide_dealer)
    choice = player_get_input
    break if choice == "stick"
    player_hit(hands, :Player, deck)
    result = calculate_hand(hands, :Player)
    break if result > 21
  end
  result
end

def computer_loop
  # game play of computer/dealer
  # evaluate hand - hit or stick
  # draw card
end

def hand_op
  # game loop until a hand is done
end

def game_loop
  # game loop until game is done
end

initialize_deck(current_deck)
deck = shuffle_deck(current_deck)
deal_initial_hands(deck, hands)

result = player_loop(hands, deck, hide_dealer)
puts result
