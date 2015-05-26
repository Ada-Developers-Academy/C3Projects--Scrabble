require 'spec_helper'

describe Scrabble::Scrabble do

  describe "class methods" do
    it "responds to 'score'" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    context "empty string entered" do
      it "returns error message" do
        expect(Scrabble::Scrabble.score("")).to eq("ERROR: Please enter a word.")
      end
    end

    context "word is nil" do
      it "returns error message" do
        expect(Scrabble::Scrabble.score(nil)).to eq("ERROR: Please enter a word.")
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



  end

  # describe "class attributes" do
  #   let(:game) { Scrabble::Scrabble.score("a") }
  #
  #   it "creates array of letters in word" do
  #     expect(game.word_array).to be_instance_of(Array)
  #   end
  #
  # end

end
