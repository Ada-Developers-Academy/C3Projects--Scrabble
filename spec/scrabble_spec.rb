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

  # describe "Handling for user input in .score" do
  #   context "word contains numbers" do
  #     word {Scrabble::Scrabble.score(@word)}
  #     expect(Scrabble::Scrabble.score(word)).include?(Fixnum)
  #     puts "Please enter a valid word"
  #   end
  # end

end
