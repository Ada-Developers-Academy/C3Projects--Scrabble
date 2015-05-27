require './lib/player'

describe Scrabble::Player do

  describe "attributes" do
    let(:player) { Scrabble::Player.new("Samanfar") }
    # 1,People's Co-op Farmers FarMar::Market,30,Portland,Multnomah,Oregon,97202

    it "has the name 'Samanfar'" do
      expect(player.name).to eq "Samanfar"
    end

  end

  describe "instance methods" do
    
    context "returns the @name instance variable" do
      it "returns "
    end

    context "returns an Array of the words played by the player" do
      it "returns the array of words"
    end

  end
end
