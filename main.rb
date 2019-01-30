# Authors: Rachelle Magaram and Akul Gulrajani and Bright Zhou

require_relative 'card'
require_relative 'deck'
require 'time.rb'

# deal cards here
deck_of_cards = Deck.new
user_cards = deck_of_cards.deal(12)
user_cards.push(Card.new("BLUE", 1, "STRIPED", "SQUIGGLE"))
user_cards.push(Card.new("BLUE", 1, "STRIPED", "OVAL"))
user_cards.push(Card.new("BLUE", 1, "STRIPED", "DIAMOND"))
card_one_index, card_two_index, card_three_index = nil

# start game loops here and intialize necessary variables
player_one_points = 0
player_two_points = 0
play = true
start_time = Time.new
current_time = Time.new
while play
  start_loop_time = Time.new
  unless deck_of_cards.set?(user_cards)
    if deck_of_cards.size >= 3
      puts 'Set not found, three more cards being added'
      user_cards.concat(deck_of_cards.deal(3))
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
    valid_input = true
    card_one_index = '13'
    card_one_index = card_one_index.to_i - 1
    unless card_one_index.between?(0, user_cards.length - 1)
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_one = user_cards[card_one_index]
  # get second card of user input
  puts "Choose another card from the #{user_cards.length} cards above: "
  loop do
    valid_input = true
    card_two_index = '14'
    card_two_index = card_two_index.to_i - 1
    if !card_two_index.between?(0, user_cards.length - 1) ||
       card_one_index == card_two_index
      valid_input = false
      puts 'Invalid input, please choose a valid card: '
    end
    break if valid_input
  end
  card_two = user_cards[card_two_index]
  # get third card of user input
  puts "Choose another card from the #{user_cards.length} cards above: "
  loop do
    valid_input = true
    card_three_index = '15'
    card_three_index = card_three_index.to_i - 1
    if !card_three_index.between?(0, user_cards.length - 1) ||
       card_one_index == card_three_index || card_two_index == card_three_index
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
    # calculate time to find set
    current_time = Time.new
    stopwatch = current_time.to_i - start_loop_time.to_i
    puts "The set was found in #{stopwatch} seconds."
    puts 'Who wins the point? Type in 1 or 2:'
    score = '1'
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
      user_cards[card_one_index] = deck_of_cards.deal(1)[0]
      user_cards[card_two_index] = deck_of_cards.deal(1)[0]
      user_cards[card_three_index] = deck_of_cards.deal(1)[0]
    else
      puts "No more cards left. GAME OVER!\n"
      play = false
    end
  else
    puts "Not a Set, try again!\n\n"
  end
end
end_time = Time.now
total_time = end_time.to_i - start_time.to_i
# announce the winner
if player_one_points > player_two_points
  puts 'player 1, you win!'
elsif player_one_points < player_two_points
  puts 'player 2, you win!'
else
  puts 'It\'s a tie!'
end
puts "The game lasted #{total_time} seconds."
