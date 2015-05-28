require 'spec_helper'
require './lib/scrabble/scrabble'
describe Scrabble::Scrabble do


  context "edge case handling" do

    it "strips numbers, special characters, and spaces" do
      expect(Scrabble::Scrabble.score(" h!e1llo ")).to eq(8)
    end

    it "returns nil for empty strings" do
      expect(Scrabble::Scrabble.score("")).to eq(nil)
    end

    it "returns nil for > 7 tiles" do
      expect(Scrabble::Scrabble.score("aeioulnr")).to eq(nil)
    end

  end # end context edge case handling


  describe "scoring letters" do

    {
      "A" => 1,
      "E" => 1,
      "I" => 1,
      "O" => 1,
      "U" => 1,
      "L" => 1,
      "N" => 1,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "D" => 2,
      "G" => 2,
      "B" => 3,
      "C" => 3,
      "M" => 3,
      "P" => 3,
      "F" => 4,
      "H" => 4,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "K" => 5,
      "J" => 8,
      "X" => 8,
      "Q" => 10,
      "Z" => 10
    }.each do |letter, value|
      it "returns #{value} for #{letter}" do
        expect(Scrabble::Scrabble.score(letter)).to eq(value)
      end
    end


    describe "scoring a word" do

      it "is case insensitive" do
        expect(Scrabble::Scrabble.score("a")).to eq(Scrabble::Scrabble.score("A"))
      end

      it "sums word scores correctly" do
        expect(Scrabble::Scrabble.score("goodbye")).to eq(14)
      end

  end # end scoring a word


    describe "gets winning word" do

      it "picks highest scoring word" do
        expect(Scrabble::Scrabble.highest_score_from(["hello", "goodbye"])).to eq("goodbye")
      end

      it "picks first with same score" do
        expect(Scrabble::Scrabble.highest_score_from(["aeiou", "lnrst"])).to eq("aeiou")
      end

      it "prefers 7 tiles" do
        expect(Scrabble::Scrabble.highest_score_from(["aeiouln", "aeiours"])).to eq("aeiouln")
      end

      it "prefers fewest tiles" do
        expect(Scrabble::Scrabble.highest_score_from(["aeiou", "k"])).to eq("k")
      end

    end # end gets winning word


  end # end class methods


end # end Scrabble class in Scrabble module
