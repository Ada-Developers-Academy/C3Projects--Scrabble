require './lib/scrabble'

describe Scrabble::Player do

  describe "Breakfast: Player#initialize" do

    # before :each do # each of the test
    #   @player_object = Scrabble::Player.new("Bob")
    # end

    it "contains a initialize(name) method" do
      expect(Scrabble::Player).to respond_to :new
    end

    let(:player) { Scrabble::Player.new("Bob") }

    # same as previous test, just different wording?
    it "checks to see if the initalizer makes a new object" do
      expect(player).to be_an_instance_of(Scrabble::Player)
    end

  end

end # describe Scrabble::Scrabble
