# Author: Akul Gulrajani and Matt Nehez and Bright Zhou
require_relative 'card'

# This class creates an array representation of a deck of cards
class Deck
  # This creates a deck of 81 shuffled cards, each containing one of the
  # four defined attributes
  def initialize
    @colors = %w[RED BLUE GREEN]
    @numbers = [*(1..3)]
    @fills = %w[EMPTY STRIPED SOLID]
    @shapes = %w[DIAMOND SQUIGGLE OVAL]
    @cards = []

    @colors.each do |color|
      @numbers.each do |number|
        @fills.each do |fill|
          @shapes.each do |shape|
            @cards.push(Card.new(color, number, fill, shape))
          end
        end
      end
    end
    @cards = @cards.shuffle
  end

  # Tells the caller the size of the deck
  def size
    @cards.length
  end

  # Deals the given number of cards
  def deal(number)
    cards_to_deal = []
    number.times do |i|
      card_to_deal = @cards.shift
      print "#{i + 1}. "
      card_to_deal.display
      cards_to_deal.push(card_to_deal)
    end
    cards_to_deal
  end

  # Method for figuring out the third card in a set given two of the cards
  def check(card_one, card_two)
    # check color
    if card_one.color == card_two.color
      card_three_color = card_one.color
    else
      card_three_color = (@colors - [card_one.color, card_two.color])[0]
    end
    # check number
    if card_one.number == card_two.number
      card_three_number = card_one.number
    else
      card_three_number = (@numbers - [card_one.number, card_two.number])[0]
    end
    # check fill
    if card_one.fill == card_two.fill
      card_three_fill = card_one.fill
    else
      card_three_fill = (@fills - [card_one.fill, card_two.fill])[0]
    end
    # check shape
    if card_one.shape == card_two.shape
      card_three_shape = card_one.shape
    else
      card_three_shape = (@shapes - [card_one.shape, card_two.shape])[0]
    end
    card_three = Card.new(card_three_color, card_three_number,
                          card_three_fill, card_three_shape)
  end

  # method for checking if there is a set in the user_cards array
  def set?(user_cards)
    loop_counter_one = 0
    loop_counter_two = 1
    while loop_counter_one < user_cards.length
      while loop_counter_two < user_cards.length
        unless loop_counter_one == loop_counter_two
          if user_cards.include?(check(user_cards[loop_counter_one],
                                       user_cards[loop_counter_two]))
            return true
          end
        end
        loop_counter_two += 1
      end
      loop_counter_one += 1
    end
    false
  end
end

# has_set = false
# card1 = nil
# card2 = nil
# card3 = nil
# while user_cards.length.empty?
#   card1 = user_cards.shift
#   i = 0
#   while user_cards[i]
#     j = i + 1
#     while user_cards[j]
#       card2 = user_cards[i]
#       card3 = user_cards[j]
#       # puts "card1:#{card1} card2:#{card2} card3:#{card3}"
#       if card1.nil? && card2.nil? && card3.nil?
#         return true
#       end
#       j += 1
#     end
#     i += 1
#   end
# end
# has_set
