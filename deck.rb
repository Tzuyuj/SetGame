#author: Matthew Nehez
#This creates a deck of 81 cards for the game SET

class deck

	@index = 0;

	# Generate array of size 81 and shuffle
	def initialize
		@array=*(0..80)
		@array.shuffle
	end	

	# Access the next element in the deck
	def push
		push = array[index]
		index += 1
	end









