require './lib/player'

describe Scrabble::Player do

  describe "Creating a player for Scrabble" do
    let(:player) { Scrabble::Player.new("Samanfar") }
    context "Scrabble needs players with names" do
      it "has a player named 'Samanfar'" do
        expect(player.name).to eq("Samanfar")
      end
    end

    # describe "Instance Methods"
    #   context "Player respond to call of plays method - collects words in Array" do
    #     it "responds to :plays" do
    #       expect(player).to respond_to :plays
    #     end
    #   end

  end
end
