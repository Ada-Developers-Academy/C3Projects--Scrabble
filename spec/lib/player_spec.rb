require './lib/scrabble/player'

describe Scrabble::Player do
  let(:patricia) { Scrabble::Player.new("Patricia") }

  before(:each) do
    patricia.play("good") # 6 pts
    patricia.play("game") # 7 pts
    patricia.play("girl") # 5 pts
  end

  describe "self.new(name)" do
    it "creates a new instance of Player" do
      expect(patricia.class).to eq(Scrabble::Player)
    end

    it "creates an instance with a name variable assigned" do
      expect(patricia.name).to eq("Patricia")
    end
  end

  describe "#play(word)" do
    it "archives the word" do
      patricia.play("hike") # 11 pts

      expect(patricia.played_words).to eq(["good", "game", "girl", "hike"])
    end

    # `context` creates a new level of scope
    context "when player has already won" do
      let(:patty) {
        x = Scrabble::Player.new("Patty")
        x.playing = false
        return x
      }

      it "returns false" do
        expect(patty.play("buoy")).to eq(false)
      end
    end
  end

  describe "#plays" do
    it "returns words played by the player" do
      expect(patricia.plays).to eq(["good", "game", "girl"])
    end
  end

  describe "#total_score" do
    it "returns the total score of the player's words" do
      # 6 + 7 + 5 = 18 pts
      expect(patricia.total_score).to eq(18)
    end
  end

  describe "#won?" do
    context "when player has > 100 points" do
      let(:patricia) {
        x = Scrabble::Player.new("Patty")
        9.times do
          x.play("quit") # 13 pts
        end
        return x
      }

      it "stops playing Scrabble" do
        # need to call to activate re-assignment
        patricia.won?

        expect(patricia.playing).to eq(false)
      end

      it "returns true" do
        expect(patricia.won?).to eq(true)
      end
    end

    context "when player has < 100 points" do
      let(:ron) {
        x = Scrabble::Player.new("Ron")
        4.times do
          x.play("boo") # 5 pts
        end
        return x
      }

      it "returns false" do
        expect(ron.won?).to eq(false)
      end
    end
  end

  describe "#highest_scoring_word" do
    it "returns the player's highest scoring word" do
      expect(patricia.highest_scoring_word).to eq("game")
    end
  end

  describe "#highest_word_score" do
    it "returns the score of the highest_scoring_word" do
      expect(patricia.highest_word_score).to eq(7)
    end
  end
end
