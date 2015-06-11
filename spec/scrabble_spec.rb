require './lib/scrabble'

describe "Score a letter" do
  it "returns the value for a single letter" do
  expect(Scrabble::Scrabble.letter_score("d")).to eq (2)
  end
end

describe "Score a word in Scrabble" do
  context "word should be a string of letters" do
    it "returns error if string includes number" do
      expect(Scrabble::Scrabble.score("1234")).to eq("Error")
    end

    it "returns error if string is space" do
      expect(Scrabble::Scrabble.score(" ")).to eq("Error")
    end

    it "returns error if sting includes special characters" do
      expect(Scrabble::Scrabble.score("$%565")).to eq("Error")
    end
  end #context end

  context "word should be less than 7 letters" do
    it "returns error when word is Superlongword" do
    expect(Scrabble::Scrabble.score("Superlongword")).to eq("Error")
    end
  end

  context "words are scored by adding letter values" do
    it "returns 5 when word is dog" do
      expect(Scrabble::Scrabble.score("dog")).to eq(5)
    end

    it "returns 14 when word is queen" do
      expect(Scrabble::Scrabble.score("Queen")).to eq(14)
    end
  end #context end
end #describe end

describe "Find highest score in an array" do
  it "returns word in array with highest score" do
    expect(Scrabble::Scrabble.highest_score_from(["boy", "jazz", "dog"])).to eq("jazz")
  end

  context "if two words have the same score:" do
      it "returns word with fewer tiles" do
       expect(Scrabble::Scrabble.highest_score_from(["dog","ok","win"])).to eq("ok")
      end

      it "unless one word is 7 letters in length, in which case it returns that word" do
       expect(Scrabble::Scrabble.highest_score_from(["jazz", "cat", "fizzing"])).to eq("fizzing")
      end

      it "returns first word supplied if tied words are the same length" do
        expect(Scrabble::Scrabble.highest_score_from(["cat", "dog"])).to eq("cat")
      end

      it "returns word that is 7 letters long if there is a three way tie" do
        expect(Scrabble::Scrabble.highest_score_from(["Jaywalk", "Nozzle", "Buzz", "Backing"])).to eq("Jaywalk")
      end
    end
end


