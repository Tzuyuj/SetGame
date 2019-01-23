#need to make 81 unique cards; each card has a color, number, shape, and shading (+selected/not)
#could the cards be structs? unions? or something else? class?
require 'card.rb';
#header of some kind?
num_cards_dealt = 0;
card1 = card.new;
card2 = card.new;
card3 = card.new;
while nums_cards_dealt < 12
 #deal cards
end

user_cards = 0;
while user_cards < 3
	puts 'Choose a card by entering a number from 0 to 80: ';
	#"gets" is the command for user input
	input = gets;
	card1 = Card.new;
	#if(input matches card - but how to check?) {
		#then select that card
	#}
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
if booleanNumber && booleanSymbol && booleanShading && booleanColor
	puts 'You have a set.';
	#go back to loop of dealing cards
else
	puts 'This is not a set.';
	#go back to user selection loop
end

