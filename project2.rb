# Authors: Rachelle Magaram and Akul Gulrajani

require 'card'
require 'deck'

play = 0
#playingGame = true
D = deck.new
D.initialize
user_cards = []

# deal cards here
while user_cards.length < 12 and play % 2 == 0
	user_cards[user_cards.length] = D.push
end

# display the cards
display(user_cards)

while play <= 19 # play 20 rounds
	puts 'Choose a card from the 12 above: '
	card1 = gets
	puts 'Choose another card: '
	card2 = gets
	puts 'Choose another card: '
	card3 = gets
	if check(card1,card2,card3)
		# cards pass the check
		user_cards[card1] = D.push
		user_cards[card2] = D.push
		user_cards[card3] = D.push
	end
	play += 1
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
	if not set -> return "not a set" and deselect user's cards, go back to user selection loop
	parenthesis for multiple conditions
=end
# checks user input for whether or not they match the rules above
def check (cardOne, cardTwo, cardThree)
	card1 = user_cards[cardOne]
	card2 = user_cards[cardTwo]
	card3 = user_cards[cardThree]
	booleanNumber = false, booleanSymbol = false, booleanShading = false, booleanColor = false
	if ((card1.number == card2.number and card2.number == card3.number) || (card1.number != card2.number and card1.number != card3.number and card2.number != card3.number))
		booleanNumber = true
	end
	if ((card1.shape == card2.shape and card2.shape == card3.shape) || (card1.shape != card2.shape and card1.shape != card3.shape and card2.shape != card3.shape))
		booleanSymbol = true
	end
	if ((card1.fill == card2.fill and card2.fill == card3.fill) || (card1.fill != card2.fill and card1.fill != card3.fill and card2.fill != card3.fill))
		booleanShading = true
	end
	if ((card1.color == card2.color and card2.color == card3.color) || (card1.color != card2.color and card1.color != card3.color and card2.color != card3.color))
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

def display (user_cards)
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

#playingGame = false #or should be infinite loop?


