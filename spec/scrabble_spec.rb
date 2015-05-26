require './lib/scrabble.rb'

describe "scoring words in Scrabble" do

	[
		["a",	1],
	].each do |word, score|
		it "returns #{score} for #{word}" do
			expect(Scrabble.score(word)).to eq(score)
		end
	end
	
end
