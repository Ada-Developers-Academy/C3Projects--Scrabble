module Scrabble

	class Scrabble

	 	POINTS = {
		  	"a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1, "f" => 4,
		  	"g" => 2, "h" => 4, "i" => 1, "j" => 8, "k" => 5, "l" => 1,
		  	"m" => 3, "n" => 1, "o" => 1, "p" => 3, "q" => 10, "r" => 1,
		  	"s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4, "x" => 8,
		  	"y" => 4, "z" => 10
	  	}

	  	VALID_LETTERS = POINTS.keys.join
	  	MAX_LENGTH = 7

	 	def self.process_input(word)
	 		word.downcase.chars
	 	end


		def self.valid_input?(word)
	  		# guard clause for empty string or nil input
		  	raise ArgumentError.new("Input cannot be empty or nil.") if 
		  		word == "" || word == nil

		  	word_letters = self.process_input(word)
		  	raise ArgumentError.new("Invalid input - alphabetic characters only.") if 
		  		word_letters.find { |letter| !VALID_LETTERS.include?(letter) }
	  	end

	  	def self.validate_length(word)
		  	raise ArgumentError.new("Word must be #{MAX_LENGTH} or fewer letters in length.") unless word.length <= MAX_LENGTH
	  	end

		def self.get_points(word)
		  	word_letters = Scrabble.process_input(word)

		  	word_letters.inject(0) { |sum, letter| sum + POINTS[letter] }
		end

	  	def self.score(word)
	  		Scrabble.valid_input?(word)

	  		Scrabble.validate_length(word)

	  		Scrabble.get_points(word)
	  	end

	  	def self.get_high_scores(array_of_words)
	  		score_groups = array_of_words.group_by do |word|
		  		Scrabble.valid_input?(word)	  			
	  			Scrabble.score(word)
	  		end

	  		top_score = score_groups.keys.max

	  		score_groups[top_score].flatten	# top words
	  	end

	  	def self.find_seven_letter_word(array_of_words)
	  		array_of_words.find {|word, score| word.length == MAX_LENGTH }
	  	end

	  	def self.shortest_word(array_of_words)
	  		array_of_words.min_by { |word| word.length }
	  	end

	  	def self.highest_score_from(array_of_words)
	  		high_score_words = Scrabble.get_high_scores(array_of_words)
			return high_score_words[0] if high_score_words.length == 1

		  	seven_letter_word = Scrabble.find_seven_letter_word(high_score_words)
		  	return seven_letter_word if seven_letter_word

		  	Scrabble.shortest_word(high_score_words)
	  	end
	end
end
