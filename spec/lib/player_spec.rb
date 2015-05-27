require './lib/scrabble/player'

describe "Player class" do
  let(:patricia) { Scrabble::Player.new("Patricia") }

  describe "self.new(name)" do

    it "creates a new instance with name variable assigned" do
      expect(patricia.name).to eq("Patricia")
    end
  end

  describe "#play(word)" do
    it "plays the word" do
      patricia.play("hike")

      expect(patricia.played).to eq(["hike"])
    end

    # `context` creates a new level of scope
    context "when player has already won" do
      let(:patty) {
        x = Scrabble::Player.new("Patty")
        x.playing = false
        return x
      }

      it "return false" do
        expect(patty.play("buoy")).to eq(false)
      end
    end
  end

  describe "#plays" do
    it "returns words played by the player" do
      patricia.play("good")
      patricia.play("game")
      patricia.play("girl")

      expect(patricia.plays).to eq(["good", "game", "girl"])
    end
  end

  describe "#total_score" do

  end
end
