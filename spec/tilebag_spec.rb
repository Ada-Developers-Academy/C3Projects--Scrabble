require './lib/scrabble/tilebag.rb'

describe "TileBag behavior" do

	let(:tilebag) { Scrabble::TileBag.new }

	context "With any TileBag it..." do

		it "has a default collection of tiles" do
			expect(tilebag.tiles).to_not be_nil
		end

		it "can return #tiles_remaining" do
			expect(tilebag.tiles_remaining).to eq(98)
		end

		it "selects a random element from @tiles" do
			expect(tilebag.select_tile).to_not be_nil
		end

		it "returns number of random tiles from tiles_remaining" do
			expect(tilebag.draw_tiles(5).count).to eq(5) 
		end
	end
end
