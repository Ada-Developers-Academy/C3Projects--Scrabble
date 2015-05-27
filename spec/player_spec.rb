require './lib/scrabble/player.rb'

describe "Player behavior" do

	# it "new Player instance has name attribute " do
	# 	expect(Scrabble::Player.new("Susan").name).to eq("Susan")
	# end

	let(:player) { Scrabble::Player.new(player_options) }
	let(:default_options) do
		{ 	name: "Susan",
			plays: []
		}
	end

	context "With any player it..." do
		let(:player_options) { default_options }
		# series of it "" ... blocks

		it "knows #name" do
			expect(player.name).to eq(player_options[:name])
		end

		it "has #plays" do
			expect(player.plays).to eq(player_options[:plays])
		end

		it "can add plays to #plays" do
			player.play("pickle")
			player.play("horse")
			player.play("donkey")
			expect(player.plays).to eq(["pickle", "horse", "donkey"])
		end

		it "can return total score" do
			player.play("pickle")
			player.play("horse")
			player.play("donkey")
			expect(player.total_score).to eq(14+8+14)
		end

		it "can return false if player has already won" do
			player.play("zydeco")
			player.play("zamboni")
			player.play("zydeco")
			player.play("zydeco")
			player.play("zydeco")
			expect(player.play("pickle")).to be false
		end

		it "can report win" do
			player.play("zydeco")
			player.play("zamboni")
			player.play("zydeco")
			player.play("zydeco")
			player.play("zydeco")
			expect(player.won?).to be true
		end

		it "can return false if player has not won" do
			player.play("pickle")
			player.play("horse")
			player.play("donkey")
			expect(player.won?).to be false
		end
	end

end
