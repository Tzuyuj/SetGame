# Author: Matthew Nehez

# This creates an object of class Card that determines the attributes
# of each card
class Card
  # This will determine the symbol by taking the card number Mod 3.
  # 0 == "CIRCLE",1 == "DIAMOND", 2 == "SQUIGGLE"
  def symbol(card_value)
    value = card_value % 3
    if value.zero?
      'CIRCLE'
    elsif value == 1
      'DIAMOND'
    elsif value == 2
      'SQUIGGLE'
    end
  end

  # This will determine the shading by taking the card number Mod 9, and
  # checking the range. 0-2 == "SOLID", 3-5 == "STRIPED", 6-8 =="EMPTY"
  def shading(card_value)
    value = card_value % 9
    if value.between?(0, 2)
      'SOLID'
    elsif value.between?(3, 5)
      'STRIPED'
    elsif value.between?(6, 8)
      'EMPTY'
    end
  end

  # This checks to see what range the card number is in
  # and determines color based on numbering.
  def color(card_value)
    if card_value.between?(0, 8) ||
       card_value.between?(27, 35) ||
       card_value.between?(54, 62)
      'GREEN'
    elsif card_value.between?(9, 17) ||
          card_value.between?(36, 44) ||
          card_value.between?(63, 71)
      'RED'
    elsif card_value.between?(18, 26) ||
          card_value.between?(45, 53) ||
          card_value.between?(72, 80)
      'BLUE'
    end
  end

  # This checks how many shapes will appear on screen.
  # If the card number is 0-26 == 1, 27-53 == 2, 54-80 == 3
  def number(card_value)
    if card_value.between?(0, 26)
      '1'
    elsif card_value.between?(27, 53)
      '2'
    elsif card_value.between?(54, 80)
      '3'
    end
  end
end
