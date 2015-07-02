require './lib/scrabble'

describe "When determining scoring for tiles in Scrabble class" do
  context ".score_letter" do

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

    Scrabble::Scrabble::SCORE_CHART[10].each do |letter|
      it "returns point value of 10 for letter #{letter}" do
        expect(Scrabble::Scrabble.score_letter(letter)).to eq (10)
      end
    end

  end


  context ".score" do
    it "returns score of 6 for ADB" do
      expect(Scrabble::Scrabble.score("ADB")).to eq (6)
    end

    it "returns score of 1 for I" do
      expect(Scrabble::Scrabble.score("I")).to eq (1)
    end

    it "returns score of 4 for sad" do
      expect(Scrabble::Scrabble.score("sad")).to eq (4)
    end

    it "returns score of 10 for CAMP" do
      expect(Scrabble::Scrabble.score("CAMP")).to eq (10)
    end

    it "returns score of 0 for empty string" do
      expect(Scrabble::Scrabble.score("")).to eq (0)
    end

  end

  context ".highest_score_from" do
    it "returns word with fewer letters if points are tied" do
      expect(Scrabble::Scrabble.highest_score_from(["CAMP", "Q", "no"])).to eq ("Q")
    end

    it "returns word with 7 letters if points are tied" do
     expect(Scrabble::Scrabble.highest_score_from(["ABCDEFG", "JX"])).to eq ("ABCDEFG")
    end

    it "returns first word if two words have the same score and length" do
      expect(Scrabble::Scrabble.highest_score_from(["CAT", "BAT", "AT"])).to eq ("CAT")
    end
  end
end


describe "For Player class" do
  subject { Scrabble::Player.new("Bob") }

  context ".new" do
    it "creates an instance of the Player class" do
      expect(subject).to be_a (Scrabble::Player)
    end
  end

  context ".name" do
    it "returns @name for instance of Player" do
      expect(subject.name).to eq ("Bob")
    end
  end

  context ".plays" do
    it "returns array of words that have been played" do
      expect(subject.plays).to eq ([])
    end
  end

  context ".play(word)" do
    it "adds word to the @plays array" do
      expect(subject.play("blahblah")).to eq (["blahblah"])
    end
  end




end
