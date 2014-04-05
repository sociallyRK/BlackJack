class Blackjack
	def initialize 
		@players_cards = []
		@dealers_cards = []
		@hash_display = { 0=>"K", 
						1=>"A11",
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
						"A11"=>11,
						"A1"=>1,
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
						"Q"=>10,
						"Hidden"=>10
					}
	end


	def show_hands
		puts "=========================================== "
		puts "CARDS ON TABLE"
		puts "Players: #{@players_cards} : #{sum_hand(@players_cards)}"
		if @dealers_cards.include?("Hidden")
		puts "Dealers: #{@dealers_cards} : ~ #{sum_hand(@dealers_cards)}"
		else 
		puts "Dealers: #{@dealers_cards} : #{sum_hand(@dealers_cards)}"
		end
	end
	
	#this code is not currently being used
	def handle_ace(hand,sum)
		puts "inside handleace #{sum} and #{hand}"
		if sum > 21 && hand.include?(21)
			hand.each { |x| 
				if x=="A21" 
				x="A1" 
				end}
			return hand
		end
	end


	def sum_hand(hand)
		sum = 0
		hand.each { |x| sum+=@hash_value[x] }
		if sum > 21 && hand.include?("A11")
			sum -=10
		end
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
	def deal_dealer()
		card1 = rand(12)
		value_card1 = @hash_display[card1]
		value_card2 = "Hidden"
		your_hand =[]
		your_hand.push value_card1
		your_hand.push value_card2
		return your_hand
	end
	
	def reverse_dealers_card()
		@dealers_cards[1] = @hash_display[rand(12)]
	end

	def wanna_hit()
		puts "Do you want to hit? "
		response = gets.chomp()
	end

	def hit()
		hitcard = rand(12)
		value_hitcard = @hash_display[hitcard]
	end

	def play_hand_for_player
	while sum_hand(@players_cards) < 21 do
		self.show_hands
		response = self.wanna_hit()
			if response == "Yes" 
			hit_card = self.hit()
			@players_cards.push hit_card
			else
			return puts "You stayed. Safe Move. Dealer's Turn."			
			end
		p @players_cards
		puts "sum is #{sum_hand(@players_cards)}"
	end
		if sum_hand(@players_cards) > 21
			puts "You Busted. Game Over"
			Process.exit
			else
			puts show_hands
			puts "Nice Job.  Lets see what the dealer has."
			return
		end
	end
	def play_hand_for_dealer
		self.show_hands
		while sum_hand(@dealers_cards) <= 21 do
			if sum_hand(@dealers_cards) < 17
			hit_card = self.hit()
			puts "Hit the dealer"
			@dealers_cards.push hit_card
			puts self.show_hands
			elsif sum_hand(@dealers_cards) >= 17 && sum_hand(@dealers_cards) <= 21
				if sum_hand(@dealers_cards) > sum_hand(@players_cards)
					return puts "Dealer Stays & Dealer Wins"
				elsif sum_hand(@dealers_cards) < sum_hand(@players_cards)
					return puts "Dealer Stays & Player Wins"
				else
					return puts "Dealer Stays & It's a Draw"
				end
			end				
		end
		if sum_hand(@dealers_cards) > 21
			puts "Dealer Busted. Game Over. Player Wins"
			Process.exit
			elsif @dealerscards 
			return
		end
	end



	def play_game
		puts "\e[H\e[2J"
		p "Dealing Cards"
		@players_cards = self.deal()
		@dealers_cards = self.deal_dealer()
		self.play_hand_for_player
		self.reverse_dealers_card
		self.play_hand_for_dealer
	end


end

gameA = Blackjack.new
gameA.play_game

