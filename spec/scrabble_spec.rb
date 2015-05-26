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
			expect(Scrabble.score(word)).to eq(score)
		end
	end
	
end
