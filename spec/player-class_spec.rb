require './lib/scrabble.rb'

describe "Player" do
  player = Scrabble::Player.new("Harry")

  describe "playing Scrabble" do
    player.play("hello")
    player.play("big")

    context "upon initialization" do
      it "returns the name, #name" do
        expect(player.name).to eq("Harry")
      end

      it "returns an array of the played words, #plays" do
        expect(player.plays.class).to be(Array)
      end
    end

    it "adds the newly played word to the play array, #play(word)" do
      expect(player.plays).to eq(["hello", "big"])
    end

    it "totals the score of all the words played, #total_score" do
      expect(player.total_score).to eq(14)
    end

    it "returns false for #won?" do
      expect(player.won?).to eq(false)
    end

    it "returns the #highest_scoring_word of all words played" do
      expect(player.highest_scoring_word).to eq("hello")
    end

    it "returns the #highest_word_score associated with the #highest_scoring_word" do
      expect(player.highest_word_score).to eq(8)
    end
  end

  describe "winning" do
    new_player = Scrabble::Player.new("Ron")
    new_player.play("zzzzzzz") # 70 points
    new_player.play("zzz") # 30 points

    it "returns true for #won? if player has 100 or more points" do
      expect(new_player.won?).to eq(true)
    end

    it "returns false if user tries to add another word, #play_word" do
      expect(new_player.play("new")).to eq(false)
    end
  end
end
