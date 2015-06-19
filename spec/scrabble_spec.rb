require './lib/scrabble.rb'

describe Scrabble do

  context "Scoring words with errors" do

    it "returns Error if the word has too many letters" do
      expect(Scrabble::Scrabble.score("watermelon")).to eq("Error")
    end

    it "returns Error if nothing is entered" do
      expect(Scrabble::Scrabble.score("")).to eq("Error")
    end

    it "returns Error if the word has numbers in it" do
      expect(Scrabble::Scrabble.score("app3le")).to eq("Error")
    end

    it "returns Error if the word contains special characters" do
      expect(Scrabble::Scrabble.score("ap@le")).to eq("Error")
    end
  end

  context "Scoring words" do

    [
      ["a",  1],
      ["ab", 4],
      ["apple", 9],
      ["A", 1],
      ["BAnaNA", 8]
    ].each do |word, score|
      it "returns #{score} for #{word}" do
        expect(Scrabble::Scrabble.score(word)).to eq(score)
      end
    end
  end

  context "Highest scoring word" do

    # it "returns an array of values" do
    #   expect(Scrabble::Scrabble.highest_score_from(["apple", "app", "le"])).to eq([9, 7, 2])
    # end
    #
    # it "returns a hash of words and their values" do
    #   expect(Scrabble::Scrabble.highest_score_from(["apple", "app", "le"])).to eq({"apple"=>9, "app"=>7, "le"=>2})
    # end

    it "returns the word with the highest value" do
      expect(Scrabble::Scrabble.highest_score_from(["apple", "app", "le"])).to eq("apple")
    end

    it "returns the shorter word if multiple words have the same highest value" do
      expect(Scrabble::Scrabble.highest_score_from(["app","apple", "jo", "le"])).to eq("jo")
    end

    it "returns the word with 7 letters over the shorter word if multiple words have the same highest value" do
      expect(Scrabble::Scrabble.highest_score_from(["seventy", "apple", "jobs"])).to eq("seventy")
    end

    it "returns the first word in the array if multiple words have the same highest value and length" do
      expect(Scrabble::Scrabble.highest_score_from(["taco", "noms", "cat"])).to eq("taco")
    end

  end

end
