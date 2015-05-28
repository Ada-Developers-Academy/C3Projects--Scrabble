require './lib/scrabble.rb'

describe "Player" do
  player = Scrabble::Player.new("Harry")

  describe "initialize(name)" do
    it "returns the name, #name" do
      expect(player.name).to eq("Harry")
    end

    it "returns an array of the played words, #plays" do
      expect(player.plays.class).to be(Array)
    end
  end

  describe "playing Scrabble" do
    player.play("hello")
    player.play("big")

    it "adds the newly played word to the play array, #play(word)" do
      expect(player.plays).to eq(["hello", "big"])
    end

    it "totals the score of all the words played, #total_score" do
      expect(player.total_score).to eq(14)
    end
  end

  describe "winning" do
    
  end
end
