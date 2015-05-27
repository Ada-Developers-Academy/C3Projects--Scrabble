require './lib/scrabble.rb'

describe Scrabble do
  context "Scoring letters" do

    it "returns Error if the word has too many letters" do
      expect(Scrabble::Scrabble.score("watermelon")).to eq("Error")
    end

    # it "returns Error if the word doesn't have only letters" do
    #   expect(Scrabble::Scrabble.score("app3le")).to eq("Error")
    # end

    # it "returns 1 for a" do
    #   expect(Scrabble::Scrabble.score("a")).to eq(1)
    # end
    #
    # it "returns 4 for ap" do
    #   expect(Scrabble::Scrabble.score("ab")).to eq(4)
    # end
    [
      ["a",  1],
      ["ab", 4]
    ].each do |word, score|
      it "returns #{score} for #{word}" do
        expect(Scrabble::Scrabble.score(word)).to eq(score)
      end
    end


  end
end
