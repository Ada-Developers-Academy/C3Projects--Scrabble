require './lib/scrabble'

describe Scrabble::Scrabble do

  describe "This method returns the score of a given word" do

    context "Scrabble scores each letter of a word with a specific point value" do
      it "returns 5 points for the word 'cat'" do
        expect(Scrabble::Scrabble.score("cat")).to eq(5)
      end

      it "returns 8 points for the word 'horse'" do
        expect(Scrabble::Scrabble.score("horse")).to eq(8)
      end
    end

    context "Players are rewarded 50pts for using all 7 tiles" do
      it "rewards 50 bonus points for 'tractor' for using 7 tiles" do
        expect(Scrabble::Scrabble.score("tractor")).to eq(59)
      end
    end

    context "An error message is returned if invalid input is provided" do
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
  end

  describe "This method returns the word in a provided array with the highest score" do
    
    context "In Scrabble, the highest score wins" do
      it "returns the word (horse) with the highest score" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "horse"])).to eq("horse")
      end
    end

    context "If multiple words have the same score, the one with fewer tiles is preferred" do
      it "returns the word with fewer tiles (farm) if multiple words have the same score" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "horse", "piglet", "farm"])).to eq("farm")
      end
    end

    context "7 letter words receive a bonus in Scrabble" do
      it "returns the 7 letter word (tractor) when other words have the same score" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "horse", "farm", "piglet", "tractor", "spider"])).to eq("tractor")
      end
    end

    context "Protection for empty array being passed" do
      it "returns an error message when an empty array is passed" do
        expect(Scrabble::Scrabble.highest_score_from([])).to eq("Error, please provide an array of words.")
      end

    end
  end
end
