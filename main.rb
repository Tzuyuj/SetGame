# Authors: Rachelle Magaram and Akul Gulrajani and Bright Zhou

require_relative 'card'
require_relative 'deck'

# deal cards here
deck_of_cards = Deck.new
user_cards = deck_of_cards.deal(12)

# start game loops here and intialize necessary variables
player_one_points = 0
player_two_points = 0
play = true
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
    user_cards[i].display
  end
  valid_input = true
  # get first card of user input
  puts "\nChoose a card from the #{user_cards.length} cards above: "
  loop do
    card_one_index = gets
    card_one_index = card_one_index.to_i - 1
    unless card_one_index.between?(0, user_cards.length - 1)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_one = user_cards[card_one_index]
  # get second card of user input
  puts "Choose another card from the #{user_cards.length}: "
  loop do
    card_two_index = gets
    card_two_index = card_two_index.to_i - 1
    unless card_two_index.between?(0, user_cards.length - 1)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_two = user_cards[card_two_index]
  # get third card of user input
  puts "Choose another card from the #{user_cards.length}: "
  loop do
    card_three_index = gets
    card_three_index = card_three_index.to_i - 1
    unless card_three_index.between?(0, user_cards.length - 1)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_three = user_cards[card_three_index]

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
      user_cards[card_one_index] = deck_of_cards.deal(1)
      user_cards[card_two_index] = deck_of_cards.deal(1)
      user_cards[card_three_index] = deck_of_cards.deal(1)
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
