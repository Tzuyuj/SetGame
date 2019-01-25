#need to make 81 unique cards; each card has a color, number, shape, and shading (+selected/not)
#could the cards be structs? unions? or something else? class?
require 'card.rb';
#header of some kind?
num_cards_dealt = 0;
card1 = card.new;
card2 = card.new;
card3 = card.new;

int play = 0;
#boolean playingGame = true;
while play <= 19 #play 20 rounds
	while num_cards_dealt < 12  && play % 2 == 0
	 #deal cards
	end
	play++;
	user_cards = 0;
	#while user_cards < 3 
	if play % 2 != 0
		puts 'Choose a card by entering a number from 0 to 80: ';
		#"gets" is the command for user input
		input = gets;
		card1 = Card.new(input);
		puts 'Choose another card by entering a different number from 0 to 80: ';
		input = gets;
		card2 = Card.new(input);
		puts 'Choose another card by entering a different number from 0 to 80: ';
		input = gets;
		card3 = Card.new(input);
	end
end


booleanNumber = false, booleanSymbol = false, booleanShading = false, booleanColor = false;
=begin
	4 groups of conditions, all of which must be satisfied!
	group 1: They all have the same number or have three different numbers.
	if(
	group 2: They all have the same symbol or have three different symbols.
	group 3: They all have the same shading or have three different shadings.
	group 4: They all have the same color or have three different colors.
	make a boolean variable for each group; test each group separately
	make elaborate if(group1 && group2 && group3 && group4) test at the end line 35
	if set -> return "it's a set" and go back to loop of dealing cards
	if not set -> return "not a set" and deselect user's cards, go back to user selection loop
	parenthesis for multiple conditions
=end
if((card1.number==card2.number && card2.number==card3.number) || (card1.number!=card2.number && card1.number!=card3.number && card2.number!=card3.number))
	booleanNumber = true;
end
if(card1.shape.equals(card2.shape) && card2.shape.equals(card3.shape)) || (!card1.shape.equals(card2.shape) && !card1.shape.equals(card3.shape) && !card2.shape.equals(card3.shape))
	booleanSymbol = true;
end
if(card1.fill.equals(card2.fill) && card2.fill.equals(card3.fill)) || (!card1.fill.equals(card2.fill) && !card1.fill.equals(card3.fill) && !card2.fill.equals(card3.fill))
	booleanShading = true;
end
if(card1.color.equals(card2.color) && card2.color.equals(card3.color)) || (!card1.color.equals(card2.color) && !card1.color.equals(card3.color) && !card2.color.equals(card3.color))
	booleanColor = true;
end

if booleanNumber && booleanColor && booleanShading && booleanSymbol
	puts 'You have a set.';
	play++;
	#go back to loop of dealing cards
else
	puts 'This is not a set.';
	#go back to user selection loop
end

#playingGame = false; #or should be infinite loop?


