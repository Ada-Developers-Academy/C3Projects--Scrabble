require 'spec_helper'

#self.score(word): returns the total score value for the given word. The word is input as a string (case insensitive). The chart below shows the point value for a given letter.
describe "Converting words to a score" do
  context "does not accept empty value" do
    it "returns a zero value" do
      expect(Scrabble::Scrabble.score("")).to eq(0)
    end
  end

  context "only accepts a-z characters, will not accept a single non alphabetical character" do
    it "returns a 0 value" do
      expect(Scrabble::Scrabble.score(5)).to eq(0)
    end
  end

  context "only accepts a-z characters, will not accept a word with non alphabetical characters" do
    it "returns a 0 value" do
      expect(Scrabble::Scrabble.score("g652")).to eq(0)
    end
  end

  context "assigns points per letter in word for a total word score" do
    it "returns a score of 8 (3, 1, 1, 2, 1)" do
      expect(Scrabble::Scrabble.score("corgi")).to eq(8)
    end
  end

end #ends describe block

describe "comparing multiple words to find the highest score" do
  context "finds the highest scoring word from an array of words" do
    it "returns the word 'cheese'" do
      expect(Scrabble::Scrabble.highest_score_from(["cheese", "mouse"])).to eq("cheese")
    end
  end

  context "If there are multiple words that are the same score and same length, pick the first one in supplied list" do
    it "returns the word 'cheese'" do
      expect (Scrabble::Scrabble.highest_score_from(["cheese", "choose"]))

    end
  end

  context "There is a bonus for using all 7 tiles. If score is tied between a player who used all 7 tiles and a player who used fewer tiles, 7 tiles wins." do
    it "returns the word 'narwhal'" do
      expect (Scrabble::Scrabble.highest_score_from(["narwhal", "zero"]))

    end
  end

  context "It’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters." do
    it "returns the word 'bye'" do
      expect (Scrabble::Scrabble.highest_score_from(["hello", "bye"]))
    end
  end
end # ends describe block
