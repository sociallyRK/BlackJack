class Blackjack
	def initialize 
#		@player = player
#		@hand = hand
		@hash_display = { 0=>"K", 
						1=>"A",
						2=>"2",
						3=>"3",
						4=>"4",
						5=>"5",
						6=>"6",
						7=>"7",
						8=>"8",
						9=>"9",
						10=>"10",
						11=>"J",
						12=>"Q"
					}

		@hash_number = { 0=>10, 
						1=>11,
						2=>2,
						3=>3,
						4=>4,
						5=>5,
						6=>6,
						7=>7,
						8=>8,
						9=>9,
						10=>10,
						11=>10,
						12=>10
					}
	end

	def play_game
		p hand = self.deal()
		response = self.wanna_hit()
			if response == "Yes" 
			hit_card = self.hit()
			hand.push hit_card
			else
			end
		p hand
		puts "sum is #{sum_hand(hand)}"

	end
	
	def sum_hand(hand)
		sum = 0
		hand.each { |x| sum+=x }
		return sum
	end
	def deal()
		card1 = rand(12)
		card2 = rand(12)
		your_hand =[]
		your_hand.push card1
		your_hand.push card2
		return your_hand
	end

	def wanna_hit()
		puts "Do you want to hit? "
		response = gets.chomp()
	end

	def hit()
		hitcard = rand(12)
		#self.push hitcard
	end
end

gameA = Blackjack.new
gameA.play_game

