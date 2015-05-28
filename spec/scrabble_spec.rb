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
    it "'zenith' returns 18 points total" do
      expect(Scrabble::Scrabble.score("zenith")).to eq 18
    end

    # g= 2, l= 1, a= 1, d= 2 total_points = 6
    it "'glad' returns 6 points total" do
      expect(Scrabble::Scrabble.score("glad")).to eq 6
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

    # added shuffle to spec examples to make sure it is not just returning the first valid value
    it "returns the word with the top score" do
      expect(Scrabble::Scrabble.highest_score_from(["wow", "cow", "sow"].shuffle)).to eq("wow")
    end

    # both louder and cub are 7
    it "returns the shorter word if two scores match" do
      expect(Scrabble::Scrabble.highest_score_from(["louder", "cub", "late"].shuffle)).to eq("cub")
    end

    # both loudest and club are 8
    it "returns the 7-letter word if two scores match" do
      expect(Scrabble::Scrabble.highest_score_from(["loudest", "club", "bar"].shuffle)).to eq("loudest")
    end

    # loudest, club and 8
    it "returns the 7-letter word if three scores match" do
      expect(Scrabble::Scrabble.highest_score_from(["loudest", "club", "cow"].shuffle)).to eq("loudest")
    end

    # leap and name are 6 points and 4 letters
    it "returns the first word if two scores and lengths match" do
      expect(Scrabble::Scrabble.highest_score_from(["leap", "name", "nil"])).to eq("leap")
    end
  end

end
