module Scrabble

	class Player
		attr_accessor :plays
		attr_reader :name

		def initialize(player_hash)
			@name = player_hash[:name]
			@plays = []
		end

		def play(word)
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
	end
end
