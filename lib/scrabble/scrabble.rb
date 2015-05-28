module Scrabble

	class Scrabble

	 	POINTS = {
		  	"a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1, "f" => 4,
		  	"g" => 2, "h" => 4, "i" => 1, "j" => 8, "k" => 5, "l" => 1,
		  	"m" => 3, "n" => 1, "o" => 1, "p" => 3, "q" => 10, "r" => 1,
		  	"s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4, "x" => 8,
		  	"y" => 4, "z" => 10
	  	}

	  	VALID_LETTERS = POINTS.keys.reduce(:+)

	  	def initialize
	  	end

	 	def self.process_input(word)
	 		word_letters = word.downcase.split("")
	 	end


		def self.valid_input?(word)
	  		# guard clause for empty string or nil input
		  	return false if word == "" || word == nil

		  	word_letters = self.process_input(word)
		  	return false if word_letters.find { |letter| !VALID_LETTERS.include?(letter) }
			
		  	true
	  	end

	  	def self.check_length(word)
		  	return false unless word.length <= 7
		  	true
	  	end

		def self.get_points(word)
		  	word_letters = Scrabble.process_input(word)

		  	word_score = word_letters.inject(0) do |sum, letter|
		  		sum + POINTS[letter]
		  	end
		end

	  	def self.score(word)
		  	# guard clause for non-alphabetic user input
	  		return "ERROR -- invalid input" unless Scrabble.valid_input?(word)

	  		# guard clause for word over 7 letters
	  		return "ERROR -- too long" unless Scrabble.check_length(word)

	  		# return score for valid word
	  		Scrabble.get_points(word)
	  	end

	  	def self.get_high_scores(array_of_words)
	  		score_groups = array_of_words.group_by do |word|
		  		return nil unless Scrabble.valid_input?(word)	  			
	  			Scrabble.score(word)
	  		end

	  		top_score = score_groups.keys.max

	  		score_groups[top_score].flatten	# top words
	  	end

	  	def self.seven_letter_word(high_score_words)
	  		seven_letter_word = high_score_words.find do 
		  		|word, score| word.length == 7 
		  	end
	  	end

	  	def self.highest_word(high_score_words)
	  		high_score_words.min_by { |word| word.length }
	  	end

	  	def self.highest_score_from(array_of_words)
	  		high_score_words	= Scrabble.get_high_scores(array_of_words)
	  		# guard clause for invalid word in array
	  		return "ERROR -- invalid word in input" unless high_score_words
	  		
		  	# pick a seven-letter word in case of a tie
		  	top_word 			= Scrabble.seven_letter_word(high_score_words)
	  		return top_word if top_word
		  	# else pick the shortest word
		  	Scrabble.highest_word(high_score_words)
	  	end
	end
end
