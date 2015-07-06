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

    it "returns error if user inputs special characters" do
      expect(Scrabble::Scrabble.score("!")).to eq ("error")
    end

    it "returns error if user inputs nothing" do
      expect(Scrabble::Scrabble.score("")).to eq ("error")
    end

    it "returns error if user inputs a space" do
      expect(Scrabble::Scrabble.score(" ")).to eq ("error")
    end

    it "returns error if user inputs a number or a special character in the middle of a word" do
      expect(Scrabble::Scrabble.score("midd!6e")).to eq ("error")
    end

    it "checks number of letters" do
      expect(Scrabble::Scrabble.score("helloworld")).to eq ("too many letters")
    end

    it "returns correct score even if user inputs upcase" do 
      expect(Scrabble::Scrabble.score("Hello")).to eq (8)
    end
  end

  context "#self.highest_score_from" do

    it "returns the highest scoring word" do
      expect(Scrabble::Scrabble.highest_score_from(["apple", "hello"])).to eq ("apple")
    end

    it "returns the shortest word if score is equal" do
      expect(Scrabble::Scrabble.highest_score_from(["dog", "long"])).to eq ("dog")
    end

    it "returns the the word with 7 letters if score is equal" do
      expect(Scrabble::Scrabble.highest_score_from(["ANGRILY", "qa"])).to eq ("ANGRILY")
    end

    it "returns the first word in list if length and score is the same" do
      expect(Scrabble::Scrabble.highest_score_from(["angrily", "deadbul", "dog", "hello"])).to eq ("angrily")
    end
  end







end