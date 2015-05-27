module Scrabble

	class Player
		attr_accessor :plays
		attr_reader :name

		def initialize(player_hash)
			@name = player_hash[:name]
			@plays = []
		end

		def play(word)
			plays << word
		end

		def total_score
			total_score = 0
			plays.each do |word|
				total_score += Scrabble.score(word)
			end
			total_score
		end
	end
end
