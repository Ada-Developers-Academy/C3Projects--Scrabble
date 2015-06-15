module Scrabble

	class Player
		attr_accessor :plays, :tiles
		attr_reader :name

		MAX_TILES = 7

		def initialize(name)
			@name 	= name
			@plays 	= []
			@tiles 	= []
		end

		def play(word)
			Scrabble.valid_input?(word)

			return false if won? # guard clause for if player has already won
			plays << word
		end

		def total_score
			plays.inject(0) { |sum, word| sum + Scrabble.score(word) }
		end

		def won?
			total_score >= 100
		end

		def highest_scoring_word
			return false if plays.empty?
			Scrabble.highest_score_from(plays)
		end

		def highest_word_score
			Scrabble.score(highest_scoring_word)
		end

		def draw_tiles(tilebag)
			return "You already have #{MAX_TILES} tiles" if tiles.length >= MAX_TILES
			number_of_empty_slots = MAX_TILES - tiles.length
			tilebag.draw_tiles(number_of_empty_slots).each do |tile|
				tiles << tile
			end
		end
	end
end
