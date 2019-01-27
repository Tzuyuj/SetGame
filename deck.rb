require_relative 'card'

# blah blah blah, shut up Rubocop
class Deck
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
end
