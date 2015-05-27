require './lib/scrabble/player-class.rb'

describe "initialize(name)" do
  it "creates a new instance of the player class with the name 'Harry'" do
    expect(Scrabble::Player.new("Harry").class).to be(Player)
  end
end

describe "#name" do
  it "returns the instance variable, name" do
    player = Scrabble::Player.new("Harry")
    expect(player.name).to eq("Harry")
  end
end

describe "#plays" do
  it "returns an array of the played words" do
    player = Scrabble::Player.new("Harry")
    expect(player.plays.class).to be(Array)
  end
end

describe "#play(word)" do
  it "adds the newly played word to the play array" do
    player = Scrabble::Player.new("Harry")
    player.play("hello")
    expect(player.plays).to eq(["hello"])
  end

  # it "returns false if the player has won" do
  #   expect(player.play(""))
  # end
end
