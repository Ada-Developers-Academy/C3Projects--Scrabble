require './lib/scrabble.rb'

describe "scoring words in Scrabble" do

	[
		["a",	 1],
		["d",	 2],
		["z",	10],
		["ap", (1 + 3)],
		["potato", (3 + 1 + 1 + 1 + 1 + 1)]
	].each do |word, score|
		it "returns #{score} for #{word}" do
			expect(Scrabble::Scrabble.score(word)).to eq(score)
		end
	end

	it "is case insensitive for input words" do
		expect(Scrabble::Scrabble.score("potato")).to eq(Scrabble::Scrabble.score("POTATO"))
	end


	[
		["apple", ["apple", "a", "ap"]],
		["zzz", ["cab", "pig", "zzz", "zamboni"]]
	].each do |word, list|
		it "returns #{word} from list of: #{list}" do
			expect(Scrabble::Scrabble.highest_score_from(list)).to eq(word)
		end
	end

end

# describe "validate user input" do
# end
