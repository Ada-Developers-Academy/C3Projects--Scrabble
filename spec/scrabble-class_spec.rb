require './lib/scrabble/scrabble-class.rb'

describe "Scrabble" do
  describe "score(word)" do
    context "for valid word input" do
      it "returns 7 for'aaaaaaa'" do
        expect(Scrabble::Scrabble.score("aaaaaaa")).to eq(7)
      end
    end

    context "for invalid word input" do
      it "returns 'ERROR' for numbers in input" do
        expect(Scrabble::Scrabble.score("hel4lo")).to eq("ERROR")
      end

      it "returns 'ERROR' for spaces in input" do
        expect(Scrabble::Scrabble.score("he llo")).to eq("ERROR")
      end

      it "returns 'ERROR' for nothing in input" do
        expect(Scrabble::Scrabble.score("")).to eq("ERROR")
      end

      it "returns 'ERROR' for nil in input" do
        expect(Scrabble::Scrabble.score(nil)).to eq("ERROR")
      end

      it "returns 'ERROR' if length of the word is > 7" do
        expect(Scrabble::Scrabble.score("eightlet")).to eq("ERROR")
      end
    end
  end

  describe "highest_score_from(array_of_words)" do
    it "returns word with highest score" do
      array_of_words = ["hello", "format", "bland", "jump", "sailor", "field", "parking"]
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("jump")
    end

    it "returns shortest word if there are two words with the same score" do
      array_of_words = ["aaaaa", "aab"]
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("aab")
    end

    it "returns the 7 letter word if it has the top number of points" do
      array_of_words = ["this", "one", "does", "not", "matter", "example", "xz"]
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("example")
    end

    it "returns the highest score even if there's a lower score with 7 letters" do
      array_of_words = ["this", "one", "does", "not", "matter", "example", "xz", "xzx"]
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("xzx")
    end

    it "returns the first of many same score words of the same length" do
      array_of_words = ["oil", "lie", "tie", "xxz", "jjq", "love"]
      expect(Scrabble::Scrabble.highest_score_from(array_of_words)).to eq("xxz")
    end
  end
end
