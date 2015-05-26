require './lib/scrabble'

describe Scrabble::Score do
  describe "class methods" do
    it "returns the total score value for a word" do
      expect(Scrabble::Score.score("cat")).to eq(4)
    end

  end
end