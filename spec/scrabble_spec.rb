require './lib/scrabble'

describe Scrabble::Scrabble do

  describe "Breakfast" do

    it "should contain a self.score method" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "should contain a self.highest_score_from method" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

    # it ""

    # it "self.score method should return an Int" do
    #   expect(Scrable::Scrabble.score("cat")).to equal
    # end

    # context "Attributes" do
    #   it "returns a value of 1" do
    #     expect(convert(0)).to eq("1")
    #   end
    # end
  end
end
