#Author: Matthew Nehez

# This creates a deck of 81 cards for the game SET
# it also does the calculations to determine the attributes of each card to make sure each card in the game is represented
#INSTRUCTIONS: All attributes are determined by the number of the card. 



class card 




#This will determine the shape by taking the card number Mod 3. 0 == "CIRCLE", 1 == "DIAMOND", 2 == "SQUIGGLE"
	def shape (x)   
		value = x % 3

		if value == 0
			shape = "CIRCLE"
		elsif value == 1
			shape = "DIAMOND"
		elsif value == 2
			shape = "SQUIGGLE"
		end	
	end

#This will determine the fill by taking the card number Mod 9, and checking the range. 0-2 == "SOLID", 3-5 == "STRIPED", 6-8 =="EMPTY"
	def fill (x) 
		value = x % 9

		if value.between(0,2)
			fill = "SOLID"
		elsif value.between(3,5)
			fill = "STRIPED"
		elsif value.between (6,8)
			fill = "EMPTY" 

		end
	
	end

#This checks to see what range the card number is in, and determines color based on numbering. 
	def color (x) 
		if x.between(0,8) or x.between(27,35) or x.between(54-62)
			color = "WHITE"
		elsif x.between(9,17) or x.between(36,44) or x.between(63-71)
			color = "RED"
		elsif x.between(18,26) or x.between(45,53) or x.between(72,80)
			color = "BLUE"
		end
	end

#This checks how many shapes will appear on screen. If the card number is 0-26 == 1, 27-53 == 2, 54-80 == 3
	def number (x)  
		if x.between(0,26)
			number = 1
		elsif x.between(27,53)
			number = 2
		elsif x.between (54-80)
			number = 3
		end	
	end
end
