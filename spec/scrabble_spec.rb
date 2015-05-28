require './lib/scrabble/scrabble.rb'

describe Scrabble::Scrabble do
	it "responds to class method called score" do
		expect(Scrabble::Scrabble).to respond_to :score
	end

	it "responds to class method called highest_score_from" do
		expect(Scrabble::Scrabble).to respond_to :highest_score_from
	end
end

describe "scoring words in Scrabble" do

	[
		["a",	 	1],
		["d",	 	2],
		["z",		10],
		["ap", 		(1 + 3)],
		["potato",	(3 + 1 + 1 + 1 + 1 + 1)]
	].each do |word, score|
		it "returns #{score} for #{word}" do
			expect(Scrabble::Scrabble.score(word)).to eq(score)
		end
	end

	it "is case insensitive for input words" do
		expect(Scrabble::Scrabble.score("potato")).to eq(Scrabble::Scrabble.score("POTATO"))
	end



end

describe "picks the word with the highest score from a list" do

	[
		["apple", 	["apple", "a", "ap"]],
		["zzz", 	["cab", "pig", "zzz", "zamboni"]],
	].each do |word, list|
		it "returns #{word} from list of: #{list}" do
			expect(Scrabble::Scrabble.highest_score_from(list)).to eq(word)
		end
	end

	it "in a score tie, chooses shorter word" do
		expect(Scrabble::Scrabble.highest_score_from(["paper", "ox", "cow"])).to eq("ox")
	end

	it "in a score tie, chooses a 7 letter word over a shorter word" do
		expect(Scrabble::Scrabble.highest_score_from(["company", "joph", "apple", "ax"])).to eq("company")
	end

	it "in a score/length tie, picks first word" do
		expect(Scrabble::Scrabble.highest_score_from(["cat", "bane", "pane"])).to eq("bane")
	end

	it "rejects array of words if any word is invalid" do
		expect(Scrabble::Scrabble.highest_score_from(["c!at", "bane", "pane"])).to eq("ERROR -- invalid word in input")
	end

	it "picks the first word in a tie" do
	end

end

describe "validate user input" do

	[
		["a1pple",	"ERROR -- invalid input"],
		["a#1pple",	"ERROR -- invalid input"],
		["ap ple", 	"ERROR -- invalid input"],
		["",		"ERROR -- invalid input"],
		[nil,		"ERROR -- invalid input"],
		["apple",	9]
	].each do |word, error|
		it "returns #{error} when user input is #{word}" do
			expect(Scrabble::Scrabble.score(word)).to eq(error)
		end
	end

	it "rejects words over 7 letters long" do
		expect(Scrabble::Scrabble.score("elephant")).to eq("ERROR -- too long")
	end

end
