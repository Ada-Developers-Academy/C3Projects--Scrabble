require './lib/scrabble'

describe Scrabble::Player do

  describe "Lunch: Player Initialize" do

    it "contains a initialize(name) method" do
      expect(Scrabble::Player).to respond_to :new
    end

    let(:player) { Scrabble::Player.new("Bob") }

    # same as previous test, just different wording?
    it "checks to see if the initalizer makes a new object" do
      expect(player).to be_an_instance_of(Scrabble::Player)
    end

    it "returns Player name (attr_accessor)" do
      expect(player.name).to eq "Bob"
    end

  end

  describe "Lunch: Player Instance Method Creation" do

    it "responds to #plays" do
      expect(Scrabble::Player.new("Bob")).to respond_to :plays
    end

    it "responds to #play(word)" do
      expect(Scrabble::Player.new("Bob")).to respond_to :play
    end

    it "responds to #total_score" do
      expect(Scrabble::Player.new("Bob")).to respond_to :total_score
    end

    it "responds to #won?" do
      expect(Scrabble::Player.new("Bob")).to respond_to :won?
    end

    it "responds to #highest_scoring_word" do
      expect(Scrabble::Player.new("Bob")).to respond_to :highest_scoring_word
    end

    it "responds to #highest_word_score" do
      expect(Scrabble::Player.new("Bob")).to respond_to :highest_word_score
    end

  end

  describe "Lunch: Player Using Instance Methods" do
    let(:player) { Scrabble::Player.new("Bob") }

    it "#plays returns an Array" do
      expect(player.plays.class).to eq Array
    end

    before :each do
      player.play("hello")
      player.play("world")
    end

    it "#plays returns an Array of the words" do
      expect(player.plays).to eq ["hello", "world"]
    end

    it "#play(word) returns false if player has already won" do
      expect(player.play("word")).to eq false
    end ### !!!! won? == true

    it "#total_score returns total score" do
      expect(player.total_score).to eq 17
    end

    it "#won? returns false when score is not 100" do
      expect(player.won?).to eq false
    end

    it "#won? returns true when score is over 100" do
      exepct(player.won?).to eq true
    end  ### !!!

    # #plays: returns an Array of the words played by the player
    # #play(word): Adds the input word to the plays Array
    # Returns false if player has already won
    # #total_score: Sums up and returns the score of the players words
    # #won?: If the player has over 100 points, returns true, otherwise returns 'false'
    # #highest_scoring_word: Returns the highest scoring word the user has played.
    # #highest_word_score: Returns the highest_scoring_word score.
  end

end # describe Scrabble::Scrabble
