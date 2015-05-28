module Scrabble

	class Player
		attr_accessor :plays, :tiles
		attr_reader :name

		def initialize(name)
			@name 	= name
			@plays 	= []
			@tiles 	= []
		end

		def play(word)
			# guard clause for if word is invalid
			return "ERROR -- invalid input" unless Scrabble.valid_input?(word)
			# guard clause for if player has already won
			return false if won? == true
			plays << word
		end

		def total_score
			total_score = 0
			plays.each do |word|
				total_score += Scrabble.score(word)
			end
			total_score
		end

		def won?
			return true if total_score >= 100
			false
		end

		def highest_scoring_word
			return false if plays == []
			Scrabble.highest_score_from(plays)
		end

		def highest_word_score
			Scrabble.score(highest_scoring_word)
		end

		def draw_tiles(tilebag)
			return "You already have 7 tiles" if tiles.length == 7
			number_of_empty_slots = 7 - tiles.length
			tilebag.draw_tiles(number_of_empty_slots).each do |tile|
				tiles.push(tile)
			end
		end
	end
end
