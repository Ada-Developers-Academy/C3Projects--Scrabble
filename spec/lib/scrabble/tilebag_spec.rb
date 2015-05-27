require "./lib/scrabble/tilebag"

describe "TILE BAG, YOU SO MAGICAL" do
  before :each do
    @tile_bag = Scrabble::TileBag.new
  end

  context "creating a new tile bag" do
    it "is an instance of TileBag" do
      expect(@tile_bag).to be_an_instance_of(Scrabble::TileBag)
    end

    it "has 98 total tiles" do
      expect(@tile_bag.tiles.count).to eq(98) # + 2 blanks?
    end

    it "has the right number of each letter." do
      # Beginning Tile Quantities:
      #   A: 9    # B: 2    # C: 2    # D: 4    # E: 12   # F: 2    # G: 3
      #   H: 2    # I: 9    # J: 1    # K: 1    # L: 4    # M: 2    # N: 6
      #   O: 8    # P: 2    # Q: 1    # R: 6    # S: 4    # T: 6    # U: 4
      #   V: 2    # W: 2    # X: 1    # Y: 2    # Z: 1

      tests = [
        ["a", 9], ["b", 2], ["c", 2], ["d", 4], ["e", 12], ["f", 2], ["g", 3],
        ["h", 2], ["i", 9], ["j", 1], ["k", 1], ["l", 4],  ["m", 2], ["n", 6],
        ["o", 8], ["p", 2], ["q", 1], ["r", 6], ["s", 4],  ["t", 6], ["u", 4],
        ["v", 2], ["w", 2], ["x", 1], ["y", 2], ["z", 1]
      ]

      tests.each do |tile|
        no_tiles = tile[1]
        tile_char = tile[0]

        tile_count = @tile_bag.tiles.find_all do |tile_in_bag|
          tile_in_bag == tile_char
        end

        expect(tile_count.length).to eq(no_tiles)
      end
    end
  end

  context "drawing from the tile bag" do
    before :each do
      @tiles = @tile_bag.draw_tiles(7)
    end

    it "returns the correct number of tiles after each draw" do
      expect(@tile_bag.tiles_remaining).to eq(91)

      @tile_bag.draw_tiles(4)

      expect(@tile_bag.tiles_remaining).to eq(87)
    end

    it "draws different letters each time" do
      other_bag = Scrabble::TileBag.new

      other_tiles = other_bag.draw_tiles(7)

      expect(@tiles == other_tiles).to eq(false) # THANK YOU LINDSEY
    end
  end
end
