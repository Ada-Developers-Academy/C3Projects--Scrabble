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

		context "player has played pickle, horse, zydeco" do
			before(:each) do
				player.play("pickle")
				player.play("horse")
				player.play("zydeco")
			end

			it "can return highest scoring word" do
				expect(player.highest_scoring_word).to eq("zydeco")
			end

			it "it can return highest word score" do
				expect(player.highest_word_score).to eq(21)
			end
		end

		context "player has not yet won" do
			before(:each) do
				player.play("pickle")
				player.play("horse")
				player.play("donkey")
			end

			it "can add plays to #plays" do
				expect(player.plays).to eq(["pickle", "horse", "donkey"])
			end

			it "can return total score" do
				expect(player.total_score).to eq(14+8+14)
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

			it "can return false if player has already won" do
				expect(player.play("pickle")).to be false
			end

			it "can report win" do
				expect(player.won?).to be true
			end
		end
	end


end
