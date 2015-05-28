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

		context "has selected 5 tiles" do
			before(:each) do
				tilebag.draw_tiles(5)
			end

			it "removes tiles from collection after selection" do
				expect(tilebag.tiles_remaining).to eq(93)
			end
		end

		context "has selected 98 tiles" do
			before(:each) do
				tilebag.draw_tiles(98)
			end

			it "collection is empty once all tiles selected" do
				expect(tilebag.tiles_remaining).to eq(0)
			end

			it "cannot draw more tiles than in tilebag" do
				expect(tilebag.draw_tiles(2)).to eq("ERROR -- not enough tiles")
			end
		end
	end
end
