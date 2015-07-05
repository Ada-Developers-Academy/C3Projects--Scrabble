require './lib/scrabble/tilebag'

describe Scrabble::TileBag do

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

    it "draws random tiles" do
      expect(bag.draw_tiles(10)).to_not eq(bag.draw_tiles(10))
    end

    it "removes the correct tiles" do
      bag2 = Scrabble::TileBag.new
      drawn_tiles = bag.draw_tiles(5)
      drawn_tiles.each do |tile|
        expect(bag.tiles[tile]).to_not eq(bag2.tiles[tile])
      end
    end
  end

  describe "#tiles_remaining" do
    it "reduces the correct amount of tiles" do
      bag.draw_tiles(5)
      # original num of tiles = 98
      expect(bag.tiles_remaining).to eq(93)
    end
  end
end
