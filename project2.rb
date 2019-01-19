#need to make 81 unique cards; each card has a color, number, shape, and shading (+selected/not)
#could the cards be structs? unions? or something else?

#header of some kind
#require 'card.rb'

int num_cards_dealt = 0;

while(nums_card_dealt < 12) {
 #deal cards
}

int user_cards = 0;
while(user_cards < 3) {
	puts 'Choose a card: '; #number cards 1-12? what does user type?
	#"gets" is the command for user input
	input = gets; #idk what kind of variable the input is here
	#if(input matches card - but how to check?) {
		#then select that card
	#}
}
=begin
4 groups of conditions, all of which must be satisfied!
group 1: They all have the same number or have three different numbers.
group 2: They all have the same symbol or have three different symbols.
group 3: They all have the same shading or have three different shadings.
group 4: They all have the same color or have three different colors.
make a boolean variable for each group; test each group separately
make elaborate if(group1 && group2 && group3 && group4) test at the end
if set -> return "it's a set" and go back to loop of dealing cards
if not set -> return "not a set" and deselect user's cards, go back to user selection loop
=end
