require './lib/scrabble/tilebag'

describe "TileBag class" do

  let(:new_bag) {
    x = Scrabble::TileBag.new
    return x
  }

  describe "#self.new" do
    it "creates an instance of TileBag" do
      expect(new_bag.class).to eq(Scrabble::TileBag)
    end

    it "has a collection of default tiles" do
      expect(new_bag.tiles).to include(:A => 9, :F => 2, :O => 8)
    end
  end
end
