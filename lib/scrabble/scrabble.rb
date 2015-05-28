module Scrabble

	class Scrabble
	  # require your gems and classes here
	  # require_relative 'scrabble/whatevs'
	  	
		POINTS = {
		  	"aeioulnrst" 	=> 1,
		  	"dg"			=> 2,
		  	"bcmp"		 	=> 3,
		  	"fhvwy" 		=> 4,
		  	"k"			 	=> 5,
		  	"jx"		 	=> 8,
		  	"qz"		 	=> 10
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
		  	word_score = 0
		  	word_letters = Scrabble.process_input(word)

		  	word_letters.each do |letter|
				letter_list, points = POINTS.find { 
					|letter_list, points| letter_list.include?(letter)
				}
				word_score += points
		  	end
		  	word_score
		end

	  	def self.score(word)
		  	# guard clause for non-alphabetic user input
	  		return "ERROR -- invalid input" unless Scrabble.valid_input?(word)

	  		# guard clause for word over 7 letters
	  		return "ERROR -- too long" unless Scrabble.check_length(word)

	  		# return score for valid word
	  		Scrabble.get_points(word)
	  	end

	  	def self.get_scores(array_of_words)
		  	all_score_word_pairs = []
		  	array_of_words.each do |word|
		  		# guard clause for invalid word in array
		  		return nil unless Scrabble.valid_input?(word)

		  		all_score_word_pairs << [Scrabble.score(word), word]
		  	end
		  	all_score_word_pairs
	  	end

	  	def self.high_scores(all_score_word_pairs)
	  		top_score = all_score_word_pairs.max[0]
	  		high_score_pairs = all_score_word_pairs.find_all { 
	  			|score, word| score == top_score 
	  		}
	  	end

	  	def self.seven_letter_word(high_score_pairs)
	  		seven_letter_word = high_score_pairs.find { 
		  		|score, word| word.length == 7 
		  	}
		  	if seven_letter_word
		  		return seven_letter_word.last
		  	else
		  		return nil
		  	end
	  	end

	  	def self.highest_word(high_score_pairs)
	  		score, winning_word = high_score_pairs.min_by { |score, word| word.length }
		  	winning_word
	  	end

	  	def self.highest_score_from(array_of_words)
	  		# get all scores
	  		all_score_word_pairs 	= Scrabble.get_scores(array_of_words)
	  		# guard clause for invalid word in array
	  		return "ERROR -- invalid word in input" unless all_score_word_pairs
	  		high_score_pairs 		= Scrabble.high_scores(all_score_word_pairs)

		  	# pick a seven-letter word in case of a tie
		  	top_word = Scrabble.seven_letter_word(high_score_pairs)
	  		return top_word if top_word
		  	# else pick the shortest word
		  	Scrabble.highest_word(high_score_pairs)
	  	end

	  	# def self.highest_score_from(array_of_words)
		  # 	all_scores = []
		  # 	array_of_words.each do |word|
		  # 		# guard clause for invalid word in array
		  # 		return "ERROR -- invalid word in input" unless Scrabble.valid_input?(word)

		  # 		all_scores << [Scrabble.score(word), word]
		  # 	end

		  # 	# find the set of words with the highest score
		  # 	high_scores = all_scores.find_all { |score, word| score == all_scores.max[0] }

		  # 	# pick a seven-letter word in case of a tie
		  # 	seven_letter_word = high_scores.find { |score, word| word.length == 7 }
		  # 	if seven_letter_word
		  # 			return seven_letter_word.last
		  # 	# pick the shortest word
		  # 	else
		  # 		highest_word = high_scores.min_by { |score, word| word.length }
		  # 		highest_word.last
		  # 	end
	  	# end
	end
end
