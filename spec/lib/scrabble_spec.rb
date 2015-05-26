require './lib/scrabble/scrabble'

describe "Scoring words played in Scrabble." do 

	context "Scrabble word scores are the sum of the scores of each of its letters" do
		# it "creates an array with the user's word, putting one letter in each index" do
		# 	expect(Scrabble::Scrabble.score("play")).to eq(["p","l","a","y"])
		# end

		it "returns 1 for 'a'" do
			expect(Scrabble::Scrabble.value_of("a")).to eq(1)
		end

		it "returns 4 for 'w'" do
			expect(Scrabble::Scrabble.value_of("w")).to eq(4)
		end

		it "the score of 'box' is 12" do
			expect(Scrabble::Scrabble.score("box")).to eq(12)
		end
	end

	context "Scrabble words cannot be longer than 7 letters." do
		it "returns an error message if the user inputs a word with more than 7 letters." do
			expect(Scrabble::Scrabble.score("hamburger")).to eq("Please enter a word that has 7 or fewer characters.")
		end
	end

	context "Scoring handles if users enters word with capital letters" do
		it "correctly scores the word even if there are capital letters" do
			expect(Scrabble::Scrabble.score("Dog")).to eq(5)
		end
	end

	context "You cannot play multiple words" do
		it "returns an error if there is a blank in the user's input" do
			expect(Scrabble::Scrabble.score("Hi Mom")).to eq("Please only enter one word.")
		end
	end

	context "You must enter at least one letter" do
		it "returns an error if the user enters a blank response" do
			expect(Scrabble::Scrabble.score("")).to eq("Please enter at least one letter.")
		end
	end

	context "Scrabble tiles do not include special characters." do
		it "returns an error message if the user inputs a special character" do
			expect(self.score("!")).to eq("This game only includes letters a-z.")
		end
	end


end