# Authors: Rachelle Magaram and Akul Gulrajani and Bright Zhou

require_relative 'card'
require_relative 'deck'
require 'time.rb'

# Controller class for Game of Set to be played
class Game
  # initializes all necessary variables for game to be played
  attr_accessor :deck_of_cards, :user_cards, :play, :player_one_points,
                :player_two_points
  def initialize
    # deal cards here
    @deck_of_cards = Deck.new
    @user_cards = @deck_of_cards.deal(12)

    # intialize other variables variables
    @player_one_points = 0
    @player_two_points = 0
    @play = true
  end
end
