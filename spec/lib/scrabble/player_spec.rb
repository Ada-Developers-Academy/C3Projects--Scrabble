require "./lib/scrabble/player"

describe "PLAYER" do

  before :each do
    @player = Scrabble::Player.new("George")
  end

  context "an instance of Player can exist:" do
    it "truly" do
      expect(@player).to be_an_instance_of(Scrabble::Player)
    end

    it "has a provided name." do
      expect(@player.name).to eq("George")

      new_player = Scrabble::Player.new("Larry Hotter")
      expect(new_player.name).to eq("Larry Hotter")
    end

    it "has zero plays to start." do
      expect(@player.plays.length).to eq(0)
    end

    it "as a result, hasn't won the game yet." do
      expect(@player.won?).to eq(false)
    end
  end

  context "a Player can have tiles:" do
    before :each do
      @bag_o_tiles = Scrabble::TileBag.new
    end

    it "has the ability to draw tiles." do
      @player.draw_tiles(@bag_o_tiles)

      # actual test
      expect(@player.tiles.length).to eq(7)
    end

    it "cannot draw past 7 tiles." do
      bag_o_tiles_before = @bag_o_tiles.tiles.length

      3.times do
        @player.draw_tiles(@bag_o_tiles)
      end

      bag_o_tiles_after = @bag_o_tiles.tiles.length

      expect(@player.tiles.length).to eq(7)
      expect(bag_o_tiles_before).to eq(bag_o_tiles_after)
    end
  end

  context "a Player can play words:" do
    before :each do
      @player.play("banana") # 8 +
      @player.play("oranges") # 8 == 16 +
      @player.play("quarter") # 16 == 32 +
      @player.play("pleaser") # 9 == 41
    end

    it "can play valid words," do
      before = @player.plays.length
      expect(@player.play("apple")).to eq(true) # though score is 9!
      expect(@player.plays.length).to eq(before + 1)
      expect(@player.plays[-1]).to eq("apple")
    end

    it "but not play numbers or symbols!" do
      before = @player.plays.length

      @player.play("apple12")
      @player.play("potato234")
      @player.play("123dog")
      @player.play("75")
      @player.play("((/..,")
      @player.play(12345)

      expect(@player.plays.length).to eq(before)
      expect(@player.plays[-1]).to eq("pleaser")
    end

    it "#plays has a list of words played by player." do
      expect(@player.plays).to eq(["banana", "oranges", "quarter", "pleaser"])
    end
  end

  context "a Player can have scores & best scores:" do
    before :each do
      @player.play("banana") # 8 +
      @player.play("oranges") # 8 == 16 +
      @player.play("quarter") # 16 == 32 +
      @player.play("pleaser") # 9 == 41
    end

    it "has a score, which can be checked." do
      expect(@player.total_score).to eq(41)
    end

    it "can check for the highest scoring word from its own plays." do
      expect(@player.highest_scoring_word).to eq("quarter")

      @player.play("quirky")

      expect(@player.highest_scoring_word).to eq("quirky")
    end

    it "can also find the score of the highest scoring word." do
      expect(@player.highest_word_score).to eq(16)

      @player.play("quirky")

      expect(@player.highest_word_score).to eq(22)
    end
  end

  context "a Player can win its game:" do
    before :each do
      @player.play("banana") # 8 +
      @player.play("oranges") # 8 == 16 +
      @player.play("quarter") # 16 == 32 +
      @player.play("pleaser") # 9 == 41 +
      @player.play("quirky") # 22 == 63 +
      @player.play("quizzes") # 34 == 97
    end

    it "player wins when score surpasses 100 points," do
      expect(@player.won?).to eq(false)

      @player.play("apple") # 9 + 97 == 106

      expect(@player.won?).to eq(true)
    end

    it "but not a moment sooner!" do
      expect(@player.won?).to eq(false)

      @player.play("eat") # 3 + 97 == 100

      expect(@player.won?).to eq(false)

      @player.play("apple") # 9 + 97 == 106

      expect(@player.won?).to eq(true)
    end

    it "and player cannot play more words after the game is won." do
      @player.play("apple") # 9 + 97 == 106
      expect(@player.total_score).to eq(106)

      @player.play("toxic") # 14
      expect(@player.total_score).to eq(106)
    end
  end
end
