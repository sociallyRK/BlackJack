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

		@hash_value = { "K"=>10, 
						"A"=>11,
						"2"=>2,
						"3"=>3,
						"4"=>4,
						"5"=>5,
						"6"=>6,
						"7"=>7,
						"8"=>8,
						"9"=>9,
						"10"=>10,
						"J"=>10,
						"Q"=>10
					}
	end

	def play_game
		p hand = self.deal()
		while sum_hand(hand) < 21 do
		
		response = self.wanna_hit()
			if response == "Yes" 
			hit_card = self.hit()
			hand.push hit_card
			else
			return puts "Your Final And Is #{hand}"			
			end
		p hand
		puts "sum is #{sum_hand(hand)}"
		end
		if sum_hand(hand) > 21
			puts "You Busted. Game Over"
			Process.exit
			else
			puts "You got 21. You Won."
		end
	end
	
	def sum_hand(hand)
		sum = 0
		hand.each { |x| sum+=@hash_value[x] }
		return sum
	end
	def deal()
		card1 = rand(12)
		card2 = rand(12)
		value_card1 = @hash_display[card1]
		value_card2 = @hash_display[card2]
		your_hand =[]
		your_hand.push value_card1
		your_hand.push value_card2
		return your_hand
	end

	def wanna_hit()
		puts "Do you want to hit? "
		response = gets.chomp()
	end

	def hit()
		hitcard = rand(12)
		value_hitcard = @hash_display[hitcard]
	end
end

gameA = Blackjack.new
gameA.play_game

