require './lib/scrabble'

describe Scrabble::Scrabble do

  describe "Breakfast: Scrabble#score" do

    it "contains a self.score method" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    [
      [5, "cat"],
      [12, "kitty"],
      [10, "rabbit"],
      [10, "bunny"],
      [9, "fly"],
      [9, "unicorn"],
      [5, "dog"]
    ].each do |value, word|
      it "returns #{value} for #{word}" do
        expect(Scrabble::Scrabble.score(word)).to eq(value)
      end
    end

    it "returns 0 for a word longer than 7 letters" do
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
  end # describe Breakfast #score...

  describe "Breakfast: Scrabble#highest_score_from" do

    it "contains a self.highest_score_from method" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

    it "returns the higher scoring word (\"KITTY\")" do
      expect(Scrabble::Scrabble.highest_score_from(["cat", "kitty"])).to eq("KITTY")
    end

    it "returns the shorter word if score is tied" do
      expect(Scrabble::Scrabble.highest_score_from(["rabbit", "bunny"])).to eq("BUNNY")
    end

    it "returns the word with 7 characters if score is tied" do
      expect(Scrabble::Scrabble.highest_score_from(["unicorn", "fly"])).to eq("UNICORN")
    end

    it "returns the word with 7 characters if score is tied (no matter the order)" do
      expect(Scrabble::Scrabble.highest_score_from(["fly", "unicorn"])).to eq("UNICORN")
    end

    it "returns the first word in the array if both score & length are tied (\"CAT\")" do
      expect(Scrabble::Scrabble.highest_score_from(["cat", "dog"])).to eq("CAT")
    end

    it "returns the first word in the array if both score & length are tied (\"DOG\")" do
      expect(Scrabble::Scrabble.highest_score_from(["dog", "cat"])).to eq("DOG")
    end

  end # describe Breakfast #highest...

end # describe Scrabble::Scrabble
