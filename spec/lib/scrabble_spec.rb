require './lib/scrabble/scrabble.rb'

describe Scrabble::Scrabble do

  describe "class methods" do
    it "responds to 'score'" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "responds to 'highest_score_from'" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

    it "responds to 'letter_to_point'" do
      expect(Scrabble::Scrabble).to respond_to :letter_to_point
    end

    context "converting letters to number scores" do
      Scrabble::Scrabble::CONVERSIONS.each do |point, letter_array|
        letter_array.find do |letter|
          it "returns #{point} for #{letter}" do
            expect(Scrabble::Scrabble.letter_to_point(letter)).to eq(point)
            end
          end
        end
      end
  end

  describe "point associations" do

   it "returns 11 points for word 'octopus'" do
      expect(Scrabble::Scrabble.score("octopus")).to eq(11)
   end

   it "returns 10 points for letter 'Z'" do
     expect(Scrabble::Scrabble.letter_to_point("Z")).to eq(10)
   end

   it "returns 4 points for letter 'W'" do
     expect(Scrabble::Scrabble.letter_to_point("W")).to eq(4)
   end

   it "returns shortest word for same score (not 7 letters)" do
     expect(Scrabble::Scrabble.highest_score_from("zya", "monkey")).to eq("zya")
   end

   it "returns 7 letter word for same score" do
     expect(Scrabble::Scrabble.highest_score_from("zya", "dddgggb", "monkey")).to eq("dddgggb")
   end

   it "returns first word for same score and same length" do
     expect(Scrabble::Scrabble.highest_score_from("cat", "bat", "mat")).to eq("cat")
   end
  end

  context "invalid input" do

    it "returns 'INVALID INPUT' for blank space" do
      expect(Scrabble::Scrabble.score(" ")).to eq("INVALID INPUT")
    end

    it "returns 'INVALID INPUT' for symbols" do
      expect(Scrabble::Scrabble.score("%%")).to eq("INVALID INPUT")
    end
  end
end
