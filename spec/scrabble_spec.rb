require 'spec_helper'
require 'scrabble'

describe Scrabble::Scrabble do

  describe ".Scrabble" do
    it "Has a score class method" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "Has a highest score class method" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end
  end

    [
      ["a", 1],
      ["e", 1],
      ["i", 1],
      ["o", 1],
      ["u", 1],
      ["l", 1],
      ["n", 1],
      ["r", 1],
      ["s", 1],
      ["t", 1],
      ["d", 2],
      ["g", 2],
      ["b", 3],
      ["c", 3],
      ["m", 3],
      ["p", 3],
      ["f", 4],
      ["h", 4],
      ["v", 4],
      ["w", 4],
      ["y", 4],
      ["k", 5],
      ["j", 8],
      ["x", 8],
      ["q", 10],
      ["z", 10],

    ].each do |letter, point|
      it "assigns #{point} point(s) per letter #{letter}" do
        expect(Scrabble::Scrabble.score(letter)).to eq(point)
      end
    end

    it "assigns total points to each word" do
      expect(Scrabble::Scrabble.score("cat")).to eq(5)
    end

    it "returns the word with the highest score" do
      x = ["cat", "dog", "mouse", "probably"]
      expect(Scrabble::Scrabble.highest_score_from(x)).to eq("probably")
    end

    #context "when words have the same score" do
    #  it "assigns winner status to the smaller word" do
    #    x = ["cat", "doe", "risen"]
    #    expect(Scrabble::Scrabble.highest_score_from(x)).to eq("cat")
    #  end
    #end

end
