require './lib/scrabble'

describe Scrabble::Scrabble do

  describe "class methods" do
    context "returns the score for a given word" do

      it "returns 5 points for the word 'cat'" do
        expect(Scrabble::Scrabble.score("cat")).to eq(5)
      end

      it "returns 8 points for the word 'horse'" do
        expect(Scrabble::Scrabble.score("horse")).to eq(8)
      end

      it "rewards 50 bonus points for 'tractor'" do
        expect(Scrabble::Scrabble.score("tractor")).to eq(59)
      end

      it "recognizes invalid user input: numbers" do
        expect(Scrabble::Scrabble.score("9")).to eq("Please enter a valid word.")
      end

      it "recognizes invalid user input: special chars" do
        expect(Scrabble::Scrabble.score(",")).to eq("Please enter a valid word.")
      end

      it "recognizes invalid user input: empty" do
        expect(Scrabble::Scrabble.score("")).to eq("Please enter a valid word.")
      end

      it "recognizes invalid user input: >7 characters" do
        expect(Scrabble::Scrabble.score("irrigation")).to eq("Please enter a valid word.")
      end
    end

    context "returns the word in the array with the highest score" do

      it "returns the word (horse) with the highest score" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "horse"])).to eq("horse")
      end

      it "returns the word with fewer tiles (farm) if multiple words have the same score" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "horse", "piglet", "farm"])).to eq("farm")
      end

      it "returns the 7 letter word (tractor) when other words have the same score" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "horse", "farm", "piglet", "tractor", "spider"])).to eq("tractor")
      end

    end
  end
end
