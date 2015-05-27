# Create a Player class with a minimum of 11 specs. The class should have the following class and instance methods:
#
# !Q self.new(name): creates a new instance with the instance variable name assigned
# #name: returns the @name instance variable
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# #total_score: Sums up and returns the score of the players words
# #won?: If the player has over 100 points, returns true, otherwise returns 'false'
# #highest_scoring_word: Returns the highest scoring word the user has played.
# #highest_word_score: Returns the highest_scoring_word score.

require "./lib/scrabble/player"

describe "PLAYER" do

  before :each do
    @player = Scrabble::Player.new("George")
  end

  context "CAN HAS EXIST! (Player.new)" do
    it "with a provided name" do
      expect(@player.name).to eq("George")

      new_player = Scrabble::Player.new("Larry Hotter")
      expect(new_player.name).to eq("Larry Hotter")
    end

    it "with zero plays to start." do
      expect(@player.plays.length).to eq(0)
    end

    it "and as a result hasn't won the game yet!" do
      expect(@player.won?).to eq(false)
    end
  end

  context "CAN PLAY WORDS!" do
    before :each do
      @player.play("banana") # 8 +
      @player.play("oranges") # 8 == 16 +
      @player.play("quarter") # 16 == 32 +
      @player.play("pleaser") # 9 == 41
    end

    it "player can play valid words," do
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

  context "CAN HAS SCORES AND BESTS!" do
    before :each do
      @player.play("banana") # 8 +
      @player.play("oranges") # 8 == 16 +
      @player.play("quarter") # 16 == 32 +
      @player.play("pleaser") # 9 == 41
    end

    it "player has a score, which can be checked!" do
      expect(@player.total_score).to eq(41)
    end

    it "player can check for the highest scoring word from its own plays!" do
      expect(@player.highest_scoring_word).to eq("quarter")

      @player.play("quirky")

      expect(@player.highest_scoring_word).to eq("quirky")
    end

    it "player can also find the score of the highest scoring word!" do
      expect(@player.highest_word_score).to eq(16)

      @player.play("quirky")

      expect(@player.highest_word_score).to eq(22)
    end
  end

  context "CAN WIN THE GAME!" do
    before :each do
      @player.play("banana") # 8 +
      @player.play("oranges") # 8 == 16 +
      @player.play("quarter") # 16 == 32 +
      @player.play("pleaser") # 9 == 41 +
      @player.play("quirky") # 22 == 63 +
      @player.play("quizzes") # 34 == 97
    end

    it "player wins when score surpasses 100 points." do
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
