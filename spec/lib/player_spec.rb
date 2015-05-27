require './lib/scrabble/player'

patricia = Scrabble::Player.new("Patricia")


describe "self.new(name)" do
  it "creates a new instance with name variable assigned" do
    expect(patricia.name).to eq("Patricia")
  end
end

describe "#play(word)" do
  it "plays the word" do
    expect(patricia.plays("hike")).to #include "hike"
  end

  it "returns false if the player already won" do
    patricia.play = ["buoy"]
    patricia.plays("buoy")

    expect(patricia.plays("booey")).to eq(false)
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
