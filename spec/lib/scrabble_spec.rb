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

	context "Scrabble tiles do not include special characters or numbers." do
		it "returns an error message if the user inputs a special character" do
			expect(Scrabble::Scrabble.score("!")).to eq("This game only includes letters a-z.")
		end

		it "returns an error message if the user inputs a number" do
			expect(Scrabble::Scrabble.score(4)).to eq("This game only includes letters a-z.")
		end
	end
end

describe "Given multiple user inputs, this will choose the winning word based on their scores and length." do

	# context "Each word needs to have its score evaluated and mapped to itself" do
	# 	it "calculates each word's score and adds word and score to a hash as a key/value pair" do
	# 		expect(Scrabble::Scrabble.multi_score(["hello","hi","bonjour","ciao"])).to include("hello" => 8, "hi" => 5, "bonjour" => 16, "ciao" => 6)
	# 	end
	# end

	# context "The word with the highest score wins" do
	# 	it "returns 16 as the winner of this array ['hello','hi','bonjour','ciao']" do
	# 		expect(Scrabble::Scrabble.highest_score_from(["hello","hi","bonjour","ciao"])).is eq(16)
	# 	end
	# end

	it "returns an array of the word with each index being another array of the word's letters" do
		expect(Scrabble::Scrabble.array_of_words_by_letter(['hi','bye'])).to eq([['h','i'],['b','y','e']])
	end

	it "returns an array of each of the different word's scores" do
		expect(Scrabble::Scrabble.array_of_word_scores(["hello","hi","bonjour"])).to eq([8,5,16])
	end

	it "returns the word in the array with the highest score" do
		expect(Scrabble::Scrabble.highest_score_from(["hello","hi","bonjour"])).to eq("bonjour")
	end






end























