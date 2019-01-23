#author: Matthew Nehez

#This creates a deck of 81 cards for the game SET

class deck

#Generate array of size 81 and shuffles it   

	def initialize
		@array=*(0..80)
		@array.shuffle
	end	







