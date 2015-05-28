require 'spec_helper'

describe Scrabble::Scrabble do

  describe "class methods" do
    it "responds to 'score'" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    context "parameter in score is invalid (nil or "")" do
      ["", nil].each do |invalid_input|
        it "returns error message when input is empty or nil" do
        expect(Scrabble::Scrabble.score(invalid_input)).to eq("ERROR: Invalid input. Either your word has more that 7 letters or you entered something ridiculous. You only have 7 tiles, and Scrabble uses WORDS!")
        end
      end
    end

    context "parameter in score is invalid (number or longer than 7 letters)" do
      [3423, 2, "elephant"].each do |invalid_input|
        it "returns error message when input is #{invalid_input}" do
        expect(Scrabble::Scrabble.score(invalid_input)).to eq("ERROR: Invalid input. Either your word has more that 7 letters or you entered something ridiculous. You only have 7 tiles, and Scrabble uses WORDS!")
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
      ["highest", ["a", "an", "dog", "highest"]],
      ["zipper", ["tan", "zipper", "pants", "hi", "cat"]]
    ].each do |highest, array_of_words|
      it "returns #{highest} from #{array_of_words}" do
        expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq(highest)
      end
    end

    context "tie for highest score, none are 7 letters long" do
      it "returns shortest word" do
        expect(Scrabble::Scrabble.highest_score_from(["dog", "cat", "hi"])).to eq("hi")
      end
    end

    context "tie for highest score, equal length, none are 7 letters long" do
      it "returns first word of shortest length" do
        expect(Scrabble::Scrabble.highest_score_from(["a", "b", "hi", "yo", "aaaa"])).to eq("hi")
      end
    end

    context "tie for highest score, one is 7 letters long" do
      it "returns 7-letter word with highest score" do
        expect(Scrabble::Scrabble.highest_score_from(["q", "mob", "tastier", "kg", "cat", "hi"])).to eq("tastier")
      end
    end

    context "parameter in highest_score_from is invalid" do
      [
        [""],
        ["dog", "unicorn", "", "splat"],
        [nil],
        ["taco", nil, "cheese"],
        [3423],
        [23, "what", "hello", ""]
      ].each do |invalid_input|
        it "returns error message when input is #{invalid_input}" do
        expect(Scrabble::Scrabble.highest_score_from(invalid_input)).to eq("ERROR: Invalid input. Either your word has more that 7 letters or you entered something ridiculous. You only have 7 tiles, and Scrabble uses WORDS!")
        end
      end
    end


  end

end
