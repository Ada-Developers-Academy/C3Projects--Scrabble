require './lib/scrabble'

describe Scrabble::Score do

  describe "class methods" do
    it "returns 5 points for the word 'cat'" do
      expect(Scrabble::Score.score("cat")).to eq(5)
    end

    it "returns 9 points for the word 'farm'" do
      expect(Scrabble::Score.score("farm")).to eq(9)
    end

    # it "should return an Array with the letters of the word" do
    #   expect (Scrabble::Score.word_to_array("cat")).to eq(["C", "A", "T"])
    # end

    # it "returns the score of the word using 7 tiles with 50 pt bonus" do
    #   expect (Scrabble::Score.highest_score_from(array_of_words).to eq(""))
    # end


  end
end
