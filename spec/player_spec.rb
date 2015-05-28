require './lib/player'

describe Scrabble::Player do

  describe "Creating a player for Scrabble" do
    context "Scrabble needs players with names" do
    let(:player) { Scrabble::Player.new("Samanfar") }
      it "has the name 'Samanfar'" do
        expect(player.name).to eq "Samanfar"
      end
    end

    it "returns ['cat', 'horse', 'piglet', 'farm']" do
      expect(player)
    end

  end
end
