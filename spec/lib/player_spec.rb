require './lib/scrabble/player'

patricia = Scrabble::Player.new("Patricia")


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

  it "returns false if the player already won" do
    patricia.playing = false

    expect(patricia.play("buoy")).to eq(false)
  end
end

describe "#plays" do
  it "returns words played by the player" do
    patricia.play("good")
    patricia.play("game")
    patricia.play("girl")

    expect(patricia.plays).to eq(["hike", "buoy", "good", "game", "girl"])
  end
end
