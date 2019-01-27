# Authors: Rachelle Magaram and Akul Gulrajani and Bright Zhou

require_relative 'card'
require_relative 'deck'

deck_of_cards = Deck.new
play = true
points = 0
# playerOnePoints = 0
# playerTwoPoints = 0

# deal cards here
user_cards = deck_of_cards.deal(12)
card_one = nil
card_two = nil
card_three = nil

# start game loops here
while play
  valid_input = true
  # get first card of user input
  puts "\n" + 'Choose a card from the 12 above: '
  loop do
    card_one = gets
    card_one = card_one.to_i - 1
    unless card_one.between?(0, 11)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_one = user_cards[card_one]
  # get second card of user input
  puts 'Choose another card: '
  loop do
    card_two = gets
    card_two = card_two.to_i - 1
    unless card_two.between?(0, 11)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_two = user_cards[card_two]
  # get third card of user input
  puts 'Choose another card'
  loop do
    card_three = gets
    card_three = card_three.to_i - 1
    unless card_three.between?(0, 11)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_three = user_cards[card_three]
  # perform card check (the check method returns the correct third
  # card and then compares it to the user's third card)
  if card_three == deck_of_cards.check(card_one, card_two)
    puts 'That is a set, you get a point!'
    points += 1
    # cards pass the check, so they have to be replaced
    # check if there are enough cards to replace them,
    # otherwise the game ends
    if deck_of_cards.size >= 3
      user_cards[card_one] = deck_of_cards.push
      user_cards[card_two] = deck_of_cards.push
      user_cards[card_three] = deck_of_cards.push
    else
      puts 'No more cards, left. GAME OVER!'
      play = false
    end
  else
    puts 'That is not a set, you lose a point!'
    points -= 1
  end
  # check if no sets are possible
end
