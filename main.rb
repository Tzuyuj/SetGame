# Authors: Rachelle Magaram and Akul Gulrajani

require_relative 'card'
require_relative 'deck'

deckOfCards = Deck.new
user_cards = []
play = 0
playerOnePoints = 0
playerTwoPoints = 0

# deal cards here
while user_cards.length < 12
	user_cards[user_cards.length] = deckOfCards.push
end

# start game loops here
while play <= 19 # play 20 rounds
	# display the cards
	display user_cards
	puts 'Choose a card from the 12 above: '
	card1 = gets
	puts 'Choose another card: '
	card2 = gets
	puts 'Choose another card: '
	card3 = gets
	if check(card1,card2,card3)
		# cards pass the check, so they have to be replaced
		user_cards[card1] = deckOfCards.push
		user_cards[card2] = deckOfCards.push
		user_cards[card3] = deckOfCards.push

		#adjust point totals here
		#points += 1
	else
		#adjust point totals here
		#points -= 1
	end
	play += 1
	#add check for no sets here
	#noSet
end


=begin
4 groups of conditions, all of which must be satisfied!
group 1: They all have the same number or have three different numbers.
if(
group 2: They all have the same symbol or have three different symbols.
group 3: They all have the same shading or have three different shadings.
group 4: They all have the same color or have three different colors.
make a boolean variable for each group test each group separately
make elaborate if(group1 and group2 and group3 and group4) test at the end line 35
if set -> return "it's a set" and go back to loop of dealing cards
if not set -> return "not a set" and deselect user''s cards, go back to user selection loop
parenthesis for multiple conditions
=end

# checks user input for whether or not they match the rules above
def check (cardOne, cardTwo, cardThree)
	cardOneInDeck = user_cards[cardOne]
	cardTwoInDeck = user_cards[cardTwo]
	cardThreeInDeck = user_cards[cardThree]
	booleanNumber = false, booleanSymbol = false, booleanShading = false, booleanColor = false
	if ((cardOneInDeck.number == cardTwoInDeck.number and cardTwoInDeck.number == cardThreeInDeck.number) || (cardOneInDeck.number != cardTwoInDeck.number and cardOneInDeck.number != cardThreeInDeck.number and cardTwoInDeck.number != cardThreeInDeck.number))
		booleanNumber = true
	end
	if ((cardOneInDeck.shape == cardTwoInDeck.shape and cardTwoInDeck.shape == cardThreeInDeck.shape) || (cardOneInDeck.shape != cardTwoInDeck.shape and cardOneInDeck.shape != cardThreeInDeck.shape and cardTwoInDeck.shape != cardThreeInDeck.shape))
		booleanSymbol = true
	end
	if ((cardOneInDeck.fill == cardTwoInDeck.fill and cardTwoInDeck.fill == cardThreeInDeck.fill) || (cardOneInDeck.fill != cardTwoInDeck.fill and cardOneInDeck.fill != cardThreeInDeck.fill and cardTwoInDeck.fill != cardThreeInDeck.fill))
		booleanShading = true
	end
	if ((cardOneInDeck.color == cardTwoInDeck.color and cardTwoInDeck.color == cardThreeInDeck.color) || (cardOneInDeck.color != cardTwoInDeck.color and cardOneInDeck.color != cardThreeInDeck.color and cardTwoInDeck.color != cardThreeInDeck.color))
		booleanColor = true
	end

	if booleanNumber and booleanColor and booleanShading and booleanSymbol
		puts 'You have a set.'
		check = true
	else
		puts 'This is not a set.'
		check = false
	end
end

def display(user_cards)
	index = 0
	while index < user_cards.length
		print "card #{index}: "
		print "#{card.shape(user_cards[index])},"
		print "#{card.fill(user_cards[index])},"
		print "#{card.color(user_cards[index])},"
		print "#{card.number(user_cards[index])}\n"
		index += 1
	end
end


