# Author: Akul Gulrajani
require 'gtk2'
require_relative 'gui'
require_relative 'game'

game = Game.new
gui = GUI.new(game)

# starts game loop
start_time = Time.new
while game.play
  start_loop_time = Time.new
  unless game.deck_of_cards.set?(game.user_cards)
    if game.deck_of_cards.size >= 3
      gui.prompt = Gtk::Label.new('Set not found, three more cards being added')
      new_cards = game.deck_of_cards.deal(3)
      game.user_cards.concat(new_cards)
      gui.add_cards(user_cards)
    else
      gui.prompt = Gtk::Label.new('No more cards left, game over')
      game.play = false
      break
    end
  end
  # displays the cards
  # game.user_cards.length.times do |i|
  #   print "#{i + 1}. "
  #   game.user_cards[i].display
  # end
  valid_input = true
  # get first card of user input
  # puts "\nChoose a card from the #{game.user_cards.length} cards above: "
  # loop do
  #   valid_input = true
  #   card_one_index =
  #   card_one_index = card_one_index.to_i - 1
  #   unless card_one_index.between?(0, game.user_cards.length - 1)
  #     valid_input = false
  #     puts 'Invalid input, please choose a valid card: '
  #   end
  #   # GUI interaction code here
  #   break if valid_input
  # end
  card_one = gui.user_input[0]
  # get second card of user input
  # puts "Choose another card from the
  # #{game.user_cards.length} cards above: "
  # loop do
  #   valid_input = true
  #   card_two_index = gets
  #   card_two_index = card_two_index.to_i - 1
  #   if !card_two_index.between?(0, game.user_cards.length - 1) ||
  #      card_one_index == card_two_index
  #     valid_input = false
  #     puts 'Invalid input, please choose a valid card: '
  #   end
  #   # GUI interaction code here
  #   break if valid_input
  # end
  card_two = gui.user_input[1]
  # get third card of user input
  # puts "Choose another card from the #{game.user_cards.length} cards above: "
  # loop do
  #   valid_input = true
  #   card_three_index = gets
  #   card_three_index = card_three_index.to_i - 1
  #   if !card_three_index.between?(0, game.user_cards.length - 1) ||
  #      card_one_index == card_three_index || card_two_index ==
  #      card_three_index
  #     valid_input = false
  #     puts 'Invalid input, please choose a valid card: '
  #   end
  #   # GUI interaction code here
  #   break if valid_input
  # end
  card_three = gui.user_input[2]
  # perform card check (the check method returns the correct third
  # card and then compares it to the user's third card)
  if card_three == game.deck_of_cards.check(card_one, card_two)
    gui.prompt = Gtk::Label.new('That is a set, you get a point!')
    # calculate time to find set
    current_time = Time.new
    stopwatch = current_time.to_i - start_loop_time.to_i
    gui.prompt = Gtk::Label.new("The set was found in #{stopwatch} seconds.")
    # gui.prompt = Gtk::Label.new('Who wins the point? Type in 1 or 2:')
    # 1 IS A DUMMY VALUE AND WILL NEED TO BE FIXED AFTER A QUICK TEST
    score = 1
    valid_input = true
    while valid_input
      if score.to_i == 1
        game.player_one_points += 1
        valid_input = false
      elsif score.to_i == 2
        game.player_two_points += 1
        valid_input = false
      else
        puts 'Retype 1 or 2:'
        score = gets
      end
    end
    # cards pass the check, so they have to be replaced
    # check if there are enough cards to replace them,
    # otherwise the game ends
    if game.deck_of_cards.size >= 3
      game.user_cards[game.user_cards.find_index(card_one)] = game.deck_of_cards.deal(1)[0]
      game.user_cards[game.user_cards.find_index(card_two)] = game.deck_of_cards.deal(1)[0]
      game.user_cards[game.user_cards.find_index(card_three)] = game.deck_of_cards.deal(1)[0]
      gui.add_cards(user_cards)
    else
      gui.prompt = Gtk::Label.new("No more cards left. GAME OVER!\n")
      game.play = false
    end
  else
    gui.prompt = Gtk::Label.new("Not a Set, try again!\n\n")
  end
end
end_time = Time.now
total_time = end_time.to_i - start_time.to_i
# announce the winner
if game.player_one_points > game.player_two_points
  gui.prompt = Gtk::Label.new('player 1, you win!')
elsif game.player_one_points < game.player_two_points
  gui.prompt = Gtk::Label.new('player 2, you win!')
else
  gui.prompt = Gtk::Label.new('It\'s a tie!')
end
gui.prompt = Gtk::Label.new("The game lasted #{total_time} seconds.")
