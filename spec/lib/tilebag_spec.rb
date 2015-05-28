require './lib/scrabble/tilebag'

describe "TileBag class" do

  let(:bag) {
    x = Scrabble::TileBag.new
    return x
  }

  describe "#self.new" do
    it "creates an instance of TileBag" do
      expect(bag.class).to eq(Scrabble::TileBag)
    end

    it "has a collection of default tiles" do
      expect(bag.tiles).to include(:A => 9, :F => 2, :O => 8)
    end
  end

  describe "#draw_tiles(n)" do
    it "returns n number of tiles" do
      expect(bag.draw_tiles(7).length).to eq(7)
    end

    it "reduces appropriate number of tiles" do
      bag.draw_tiles(7)
      num_of_tiles_left = bag.tiles.values.inject { |sum, n| sum + n}
      # original num of tiles = 98
      expect(num_of_tiles_left).to eq(91)
    end

    # it "draws random tiles" do
    # end

    # it "removes the correct tiles" do
    #   tile1 = drawn_tiles[0]
    #
    #   expect(tile_bag.tiles[tile1]).to eq()
    # end
  end
end
