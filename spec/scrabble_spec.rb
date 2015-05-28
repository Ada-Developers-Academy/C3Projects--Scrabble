require 'spec_helper'
require 'scrabble'
describe Scrabble::Scrabble do

  describe "It has class methods" do
    it "Has a score class method" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "Has a highest score from an array method" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

  end

  describe "Handling for user input in .score" do

    # z= 10, e= 1, n= 1, i= 1, t= 1, h= 4 total_points = 18
    it "zenith returns 18 points total" do
      expect(Scrabble::Scrabble.score("zenith")).to eq 18
    end

    it "returns 18 points total" do
      expect(Scrabble::Scrabble.score("zenith")).to eq 18
    end

    it "raises an ArgumentError if string contains numbers"  do
      expect {Scrabble::Scrabble.score("405rt")}.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError if string contains symbols"  do
      expect {Scrabble::Scrabble.score("résumé")}.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError if parameter is a Fixnum"  do
      expect {Scrabble::Scrabble.score(4983)}.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError if parameter is not a string"  do
      expect {Scrabble::Scrabble.score(nil)}.to raise_error(ArgumentError)
    end
  end


  describe "Returning highest scoring word in .highest_score_from method" do
    # let(:input) { Scrabble::Scrabble.score("zenith")}
    # z= 10, e= 1, n= 1, i= 1, t= 1, h= 4 total_points = 18

    it "returns the word with the top score" do
      expect(Scrabble::Scrabble.highest_score_from(["wow", "cow", "sow"])).to eq("wow")
    end

    it "returns the shorter word if two scores match" do
      expect(Scrabble::Scrabble.highest_score_from(["cowl", "wow", "sow"].shuffle)).to eq("wow")
    end

  end

end

# let(:input) { Scrabble::Scrabble.score("zenith")}
