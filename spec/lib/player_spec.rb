
require 'spec_helper'

describe Scrabble::Player do

  describe "class methods" do
    it "responds to 'new'" do
      expect(Scrabble::Player).to respond_to :new
    end


  end

  describe "attributes" do
    let(:player) { Scrabble::Player.new("Voltron") }

    it "has a name" do
      expect(player.name).to eq("Voltron")
    end

    it "has a 'plays' attribute" do
      expect(player).to respond_to :plays
    end

    it "responds to 'play'" do
      expect(player).to respond_to :play
    end

    it "responds to 'total_score'" do
      expect(player).to respond_to :total_score
    end

  end
end
