require 'spec_helper'

describe Scrabble::Scrabble do

  describe "class methods" do
    it "responds to 'score'" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    context "score parameter is invalid" do
      ["", nil].each do |invalid_input|
        it "returns error message when input is empty or nil" do
        expect(Scrabble::Scrabble.score(invalid_input)).to eq("ERROR: Invalid input. Scrabble uses WORDS.")
        end
      end

      [3423, 2].each do |invalid_input|
        it "returns error message when input is #{invalid_input}" do
        expect(Scrabble::Scrabble.score(invalid_input)).to eq("ERROR: Invalid input. Scrabble uses WORDS.")
        end
      end

    end


    [
      [1, "a"],
      [1, "e"],
      [1, "u"],
      [2, "ae"],
      [5, "dog"],
      [3, "DO"],
      [11, "zip"]
    ].each do |score, letter|
      it "returns #{score} for #{letter}." do
        expect(Scrabble::Scrabble.score(letter)).to eq(score)
      end
    end

    it "responds to 'highest_score_from'" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

    [
      ["highest", ["a", "an", "dog", "highest"]]
    ].each do |highest, array_of_words|
      it "returns #{highest} for #{array_of_words}." do
        expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq(highest)
      end
    end

    context "parameter is invalid" do
      [
        [""],
        ["dog", "unicorn", "", "splat"],
        [nil],
        ["taco", nil, "cheese"],
        [3423],
        [23, "what", "hello", ""]
      ].each do |invalid_input|
        it "returns error message when input is #{invalid_input}" do
        expect(Scrabble::Scrabble.highest_score_from(invalid_input)).to eq("ERROR: Invalid input. Scrabble uses WORDS.")
        end
      end
    end


  end

end
