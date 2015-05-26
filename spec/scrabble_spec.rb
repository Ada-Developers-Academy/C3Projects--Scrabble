require './lib/scrabble'

describe Scrabble::Score do
  describe "class methods" do
    it "returns the total score value for a word" do
      expect(Scrabble::Score.score("cat")).to eq(4)
    end

    it "returns the word in an array with the highest score" do
      expect (Scrabble::Score.highest_score_from(array_of_words).to eq(""))
    end
  end
end
