# Author: Akul Gulrajani

require_relative 'card'

# This class holds the methods responsible for checks and anything related
# to the rules
class Rules
  # initializes a rules object with a card object for
  # necessary attribute calculations
  def initialize
    @card = Card.new
  end

  # a method to display the cards in a readable format for the user
  def display(user_cards)
    index = 0
    while index < user_cards.length
      print "card #{index}: "
      print "#{@card.symbol(user_cards[index])}, "
      print "#{@card.shading(user_cards[index])}, "
      print "#{@card.color(user_cards[index])}, "
      print "#{@card.number(user_cards[index])}\n"
      index += 1
    end
  end

  # checks user input for whether or not they match the rules above
  def check(user_cards, card_one, card_two, card_three)
    one = user_cards[card_one]
    two = user_cards[card_two]
    three = user_cards[card_three]

    boolean_number = ((@card.number(one) == @card.number(two)) &&
    (@card.number(two) == @card.number(three))) || ((@card.number(one) !=
    @card.number(two)) && (@card.number(one) != @card.number(three)) &&
    (@card.number(two) != @card.number(three)))

    boolean_symbol = ((@card.symbol(one) == @card.symbol(two)) &&
    (@card.symbol(two) == @card.symbol(three))) || ((@card.symbol(one) !=
    @card.symbol(two)) && (@card.symbol(one) != @card.symbol(three)) &&
    (@card.symbol(two) != @card.symbol(three)))

    boolean_shading = ((@card.shading(one) == @card.shading(two)) &&
    (@card.shading(two) == @card.shading(three))) || ((@card.shading(one) !=
    @card.shading(two)) && (@card.shading(one) != @card.shading(three)) &&
    (@card.shading(two) != @card.shading(three)))

    boolean_color = ((@card.color(one) == @card.color(two)) &&
    (@card.color(two) == @card.color(three))) || ((@card.color(one) !=
    @card.color(two)) && (@card.color(one) != @card.color(three)) &&
    (@card.color(two) != @card.color(three)))

    if boolean_number && boolean_color && boolean_shading && boolean_symbol
      puts 'You have a set.\n'
    else
      puts 'This is not a set.\n'
    end
  end
end
