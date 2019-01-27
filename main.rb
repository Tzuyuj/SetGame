# Authors: Rachelle Magaram and Akul Gulrajani

require_relative 'deck'
require_relative 'rules'

deck_of_cards = Deck.new
rules = Rules.new
user_cards = []
play = true
points = 0
# playerOnePoints = 0
# playerTwoPoints = 0

# deal cards here
user_cards[user_cards.length] = deck_of_cards.push while user_cards.length < 12

# start game loops here
while play
  # display the cards
  rules.display(user_cards)
  puts "\n" + 'Choose a card from the 12 above: '
  loop do
    card_one = gets
    card_one = card_one.to_i
    unless card_one.between?(0, 12)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  puts 'Choose another card: '
  loop do
    card_two = gets
    card_two = card_two.to_i
    unless card_two.between?(0, 12)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  puts 'Choose another card'
  loop do
    card_three = gets
    card_three = card_three.to_i
    unless card_three.between?(0, 12)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  if rules.check(user_cards, card_one, card_two, card_three)
    # cards pass the check, so they have to be replaced
    # check if there are enough cards to replace them
    if 81 - deck_of_cards.index < 3
      user_cards[card_one] = deck_of_cards.push
      user_cards[card_two] = deck_of_cards.push
      user_cards[card_three] = deck_of_cards.push
      play = false
    end
    points += 1
  else
    points -= 1
  end
  # check if no sets are possible
end
