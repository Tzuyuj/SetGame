# Authors: Rachelle Magaram and Akul Gulrajani and Bright Zhou

require_relative 'card'
require_relative 'deck'

deck_of_cards = Deck.new
play = true

player_one_points = 0
player_two_points = 0

# deal cards here
user_cards = deck_of_cards.deal(12)
card_one, card_two, card_three = nil

# start game loops here
while play
  unless deck_of_cards.set?(deck_of_cards, user_cards)
    if deck_of_cards.size >= 3
      puts 'Set not found, three more cards being added'
      user_cards += deck_of_cards.deal(3)
    else
      puts 'No more cards left, game over'
      play = false
      break
    end
  end
  # displays the cards
  user_cards.length.times do |i|
    print "#{i + 1}. "
    card_to_deal.display
  end
  valid_input = true
  # get first card of user input
  puts "\nChoose a card from the #{user_cards.length} cards above: "
  loop do
    card_one = gets
    card_one = card_one.to_i - 1
    unless card_one.between?(0, user_cards.length - 1)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_one = user_cards[card_one]
  # get second card of user input
  puts "Choose another card from the #{user_cards.length}: "
  loop do
    card_two = gets
    card_two = card_two.to_i - 1
    unless card_two.between?(0, user_cards.length - 1)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_two = user_cards[card_two]
  # get third card of user input
  puts "Choose another card from the #{user_cards.length}: "
  loop do
    card_three = gets
    card_three = card_three.to_i - 1
    unless card_three.between?(0, user_cards.length - 1)
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
    puts 'Who wins the point? Type in 1 or 2:'
    score = gets
    valid_input = true
    while valid_input
      if score.to_i == 1
        player_one_points += 1
        valid_input = false
      elsif score.to_i == 2
        player_two_points += 1
        valid_input = false
      else
        puts 'Retype 1 or 2:'
        score = gets
      end
    end
    # cards pass the check, so they have to be replaced
    # check if there are enough cards to replace them,
    # otherwise the game ends
    if deck_of_cards.size >= 3
      user_cards[card_one] = deck_of_cards.deal(1)
      user_cards[card_two] = deck_of_cards.deal(1)
      user_cards[card_three] = deck_of_cards.deal(1)
    else
      puts 'No more cards, left. GAME OVER!'
      play = false
    end
  end
end

# announce the winner
if player_one_points > player_two_points
  puts 'player 1, you win!'
elsif player_one_points < player_two_points
  puts 'player 2, you win!'
else
  puts 'It\'s a tie!'
end
