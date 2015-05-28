require "spec_helper"
require "./lib/scrabble"

describe Scrabble::Scrabble do
  # expected functionality of Scrabble class

  describe "#is_valid?" do
    #  edge cases
    context "input should only be letters" do
      it "return an error message if enter 7" do
        expect(Scrabble::Scrabble.is_valid?([7])).to eq("Error, not valid letters.")
      end

      it "returns an error message if enter nil" do
        expect(Scrabble::Scrabble.is_valid?([])).to eq("please type something in.")
      end

    end

    it "returns the word PEA" do
      expect(Scrabble::Scrabble.is_valid?(["P", "E", "A"])).to eq(["P", "E", "A"])
    end

  end


  before :each do
    # instantiating a new Scrabble class
    @scrabble = Scrabble::Scrabble.new
  end

  context "#new" do
    it "returns a Scrabble object" do
      expect(@scrabble).to be_an_instance_of Scrabble::Scrabble
    end
  end

  context "scoring of words" do
    it "return value of 1 if input A" do
      expect(Scrabble::Scrabble.score("A")).to eq(1)
    end

    it "return value of 5 if input APE" do
      expect(Scrabble::Scrabble.score("APE")).to eq(5)
    end

    context "input is not case sensitive" do
      it "returns a score of 7 for lower case 'edge'" do
        expect(Scrabble::Scrabble.score("edge")).to eq(6)
      end
    end

  end

  describe "determines highest score of two words" do

    it "returns the word with the highest score" do
      array = ["A", "APE"]
      expect(Scrabble::Scrabble.highest_score_from(array)).to eq("APE")
    end

    context "if scores are tied" do
      context "and both words are less than 7 tiles" do
        it "returns the word with the fewest tiles" do
          array = ["KK", "Z"]
          expect(Scrabble::Scrabble.highest_score_from(array)).to eq("Z")
        end
      end

      context "with same score and same length, pick the first one" do
        it "returns the first word provided" do
          array = ["EDGE", "IIGG"]
          expect(Scrabble::Scrabble.highest_score_from(array)).to eq("EDGE")
        end
      end

      context "and one word is 7 letters long" do
        it "returns the word with 7 tiles used" do
          array = ["AAAAAAA", "KAA"]
          expect(Scrabble::Scrabble.highest_score_from(array)).to eq("AAAAAAA")
        end
      end

    end

  end

end
