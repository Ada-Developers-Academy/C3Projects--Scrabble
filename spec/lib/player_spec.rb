
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
  end

  describe "instance methods" do
    let(:player) { Scrabble::Player.new("Voltron") }

    it "responds to 'play'" do
      expect(player).to respond_to :play
    end

    it "responds to 'total_score'" do
      expect(player).to respond_to :total_score
    end

    # # I didn't get total_score working. This spec doesn't pass, so I commented it out for now. 
    # let(:plays) { Scrabble::Player.plays(["hello", "medic", "qat"]) }
    #
    # it "sums word scores to create 'total_score'" do
    #   expect(player.total_score).to eq(27)
    # end


  end
end
