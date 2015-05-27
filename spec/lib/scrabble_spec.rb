require './lib/scrabble/scrabble.rb'

describe Scrabble::Scrabble do

  describe "class methods" do
    it "responds to 'score'" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "responds to 'highest_score_from'" do
      expect(Scrabble::Scrabble). to respond_to :highest_score_from
    end
  end

  describe "associations" do
#  subject {Scrabble::Scrabble.new}
#
# context "converting letters to number scores" do
#    CONVERSIONS.each do |point, letter_array|
#      letter_array.find do |letter|
#        it "returns #{point} for #{letter}" do
#        expect(subject.letter_to_point(letter)).to eq(point)
#        end
#    end
#  end
#end
#
#    it "totals points for a word" do
#      expect(subject.word_to_points(word)).to eq(total_points)
#    end
  end
  
end
