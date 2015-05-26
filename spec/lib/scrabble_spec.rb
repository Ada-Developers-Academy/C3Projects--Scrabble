require './lib/scrabble'

describe "Determining scoring for tiles" do
  context "self.score_letter method" do

    Scrabble::Scrabble::SCORE_CHART[1].each do |letter|
      it "returns point value of 1 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (1)
      end
    end

    Scrabble::Scrabble::SCORE_CHART[2].each do |letter|
      it "returns point value of 2 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (2)
      end
    end

    Scrabble::Scrabble::SCORE_CHART[3].each do |letter|
      it "returns point value of 3 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (3)
      end
    end

    Scrabble::Scrabble::SCORE_CHART[4].each do |letter|
      it "returns point value of 4 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (4)
      end
    end

    Scrabble::Scrabble::SCORE_CHART[5].each do |letter|
      it "returns point value of 5 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (5)
      end
    end

    Scrabble::Scrabble::SCORE_CHART[8].each do |letter|
      it "returns point value of 8 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (8)
      end
    end

  end


  context "self.score method" do
    it "returns score of 6 for ADB" do
      expect(Scrabble::Scrabble.score("ADB")).to eq (6)
    end

    it "returns score of 1 for I" do
      expect(Scrabble::Scrabble.score("I")).to eq (1)
    end

    it "returns score of 4 for sad" do
      expect(Scrabble::Scrabble.score("sad")).to eq (4)
    end

  end

  context "self.highest_score_from method" do
    it "returns word with fewer letters if points are tied" do
      expect(Scrabble::Scrabble.highest_score_from(["CAMP", "Q", "no"])).to eq ("Q")
    end
  end




end
