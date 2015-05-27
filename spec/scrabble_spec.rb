require "spec_helper"
require "./lib/scrabble"

describe Scrabble::Scrabble do
  # expected functionality of Scrabble class

  #  edge cases
  context "input will only be letters" do
    it "return a message if enter 7" do
      expect(Scrabble::Scrabble.is_valid?(7)).to eq("error")
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

  # context "scoring of words" do
    it "return value of 1 if input A" do
      expect(Scrabble::Scrabble.score("A")).to eq(1)
    end

    it "return value of 5 if input APE" do
      expect(Scrabble::Scrabble.score("APE")).to eq(5)
    end

  # end

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
    end

  end
      context "and one word is 7 letters long" do
        it "returns the word with 7 tiles used" do
          array = ["QWITFHX", "APE"]
          expect(Scrabble::Scrabble.highest_score_from(array)).to eq("QWITFHX")
        end
      end

end
