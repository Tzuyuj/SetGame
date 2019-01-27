# Author: Matthew Nehez and Akul Gulrajani

# This creates an object of class Card that determines the attributes
# of each card
class Card
  attr_accessor :color, :number, :fill, :shape

  def initialize(color, number, fill, shape)
    @color = color
    @number = number
    @fill = fill
    @shape = shape
  end

  def display
    puts "#{@number} #{color} #{fill} #{shape}"
  end
end
