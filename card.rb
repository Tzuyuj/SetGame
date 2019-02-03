# Authors: Matthew Nehez and Akul Gulrajani

# This creates an object of class Card that determines the attributes
# of each card
class Card
  attr_accessor :color, :number, :fill, :shape

  # constructor method for a card object
  def initialize(color, number, fill, shape)
    @color = color
    @number = number
    @fill = fill
    @shape = shape
  end

  def image
    "img/#{@color[0]}+#{@number}+#{@fill[0]} + #{@shape[0]}.jpg"
  end

  # re-implemented equality operator for card objects so they can be compared
  def ==(other)
    @color == other.color && @number == other.number && @fill == other.fill &&
      @shape == other.shape
  end

  # prints the card's attributes for the user to see
  def display
    puts "#{@number} #{color} #{fill} #{shape}"
  end
end
