require './lib/scrabble/player.rb'

describe "Player behavior" do

	let(:player) { Scrabble::Player.new(player_options) }
	let(:default_options) do
		( "Susan" )
	end

	context "With any player it..." do
		let(:player_options) { default_options }	

		it "knows #name" do
			expect(player.name).to eq(player_options)
		end

		it "has #plays" do
			expect(player.plays).to eq([])
		end

		it "returns an error if an invalid word is played" do
			expect(player.play("appl!e")).to eq("ERROR -- invalid input")
		end

		context "player has not yet won" do
			before(:each) do
				player.play("pickle")
				player.play("horse")
				player.play("zydeco")
			end

			it "can return #plays" do
				expect(player.plays).to eq(["pickle", "horse", "zydeco"])
			end

			it "can return #highest_scoring_word" do
				expect(player.highest_scoring_word).to eq("zydeco")
			end

			it "it can return #highest_word_score" do
				expect(player.highest_word_score).to eq(21)
			end

			it "can add plays to #plays" do
				expect(player.play("cow")).to eq(["pickle", "horse", "zydeco", "cow"])
			end

			it "can return total score" do
				expect(player.total_score).to eq(14+8+21)
			end

			it "can return false if player has not won" do
				expect(player.won?).to be false
			end
		end
		
		context "player has won" do
			before(:each) do
				player.play("zydeco")
				player.play("zamboni")
				player.play("zydeco")
				player.play("zydeco")
				player.play("zydeco")
			end

			it "can report win" do
				expect(player.won?).to be true
			end

			it "cannot #play(word) if player has already won" do
				expect(player.play("pickle")).to be false
			end
		end
		
		# tile tests
		context "about drawing tiles" do
			let(:tilebag) { Scrabble::TileBag.new}

			it "starts with no tiles" do
				expect(player.tiles.length).to eq(0)
			end

			context "player has drawn tiles" do
				
				before(:each) do
					player.draw_tiles(tilebag)
				end

				it "player now has 7 tiles" do
					expect(player.tiles.length).to eq(7)
				end

				it "can't draw more than seven tiles" do
					expect(player.draw_tiles(tilebag)).to eq("You already have 7 tiles")
				end
			end
		end
	end
end
