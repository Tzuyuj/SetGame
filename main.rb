# Authors: Rachelle Magaram and Akul Gulrajani

require_relative 'deck'
require_relative 'rules'

deck_of_cards = Deck.new
rules = Rules.new
user_cards = []
play = 0
points = 0
# playerOnePoints = 0
# playerTwoPoints = 0

# deal cards here
user_cards[user_cards.length] = deck_of_cards.push while user_cards.length < 12

# start game loops here
while play <= 19 # play 20 rounds
  # display the cards
  rules.display(user_cards)
  puts 'Choose a card from the 12 above: '
  card1 = gets
  card1 = card1.to_i
  puts 'Choose another card: '
  card2 = gets
  card2 = card2.to_i
  puts 'Choose another card: '
  card3 = gets
  card3 = card3.to_i
  if rules.check(user_cards, card1, card2, card3)
    # cards pass the check, so they have to be replaced
    user_cards[card1] = deck_of_cards.push
    user_cards[card2] = deck_of_cards.push
    user_cards[card3] = deck_of_cards.push

    # adjust point totals here
    points += 1
  else
    # adjust point totals here
    points -= 1
  end
  play += 1
  # add check for no sets here
  # noSet
end
