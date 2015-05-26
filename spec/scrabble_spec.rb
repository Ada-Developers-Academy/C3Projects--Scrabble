require './lib/scrabble'

describe Scrabble::Scrabble do

  describe "Breakfast" do

    it "should contain a self.score method" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "should contain a self.highest_score_from method" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

    [
      [5, "cat"],
      [12, "kitty"],
    ].each do |value, word|
      it "returns #{value} for #{word}" do
        expect(Scrabble::Scrabble.score(word)).to eq(value)
      end
    end

    it "should return 0 for a word longer than 7 letters" do
      expect(Scrabble::Scrabble.score("supercalifragilisticexpialidocious")).to eq(0)
    end

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
