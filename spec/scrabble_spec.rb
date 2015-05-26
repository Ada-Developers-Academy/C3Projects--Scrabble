require './lib/scrabble.rb'
require 'spec_helper.rb'

describe "Scrabble" do
  # include Scrabble
  context "#self.score" do

    it "returns the correct score of a word" do
      expect(Scrabble::Scrabble.score("apple")).to eq (9)
    end
    it "returns error if user inputs a number" do
      expect(Scrabble::Scrabble.score(5)).to eq ("error")
    end
  end
end