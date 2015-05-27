require 'spec_helper'

describe Scrabble::Scrabble do

  describe '#score' do
    it "responds to #score'" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "returns 9 for 'score'" do
      expect(Scrabble::Scrabble.score('play')).to eq(9)
    end
  end

  describe '#' # START HERE AGAIN

  # before :each do
  #   @scrabble = Scrabble::Scrabble.new
  # end

  # describe "#new" do
  #   it "returns a Scrabble object" do
  #     expect(@scrabble).to be_an_instance_of Scrabble::Scrabble
  #   end
  # end

end


#   before :all do
#     Scrabble.new
#   end


