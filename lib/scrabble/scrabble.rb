
module Scrabble

	LETTER_VALUES = [
		[1, "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
		[2, "d", "g"],
		[3, "b", "c", "m", "p"],
		[4, "f", "h", "v", "w", "y"],
		[5, "k"],
		[8, "j", "x"],
		[10, "q", "z"]
	]
	

	class Scrabble

		def self.value_of(letter)
			LETTER_VALUES.each do |value_letters_array|
				if value_letters_array.include?(letter)
					return value_letters_array[0]
				end
			end
		end

		def self.score(word)
			word = word.to_s.downcase

			word_score = 0

			word_array = word.chars.to_a

			if word_array.length > 7
				return "Please enter a word that has 7 or fewer characters."

			elsif word_array.include?(" ")
				return "Please only enter one word."

			elsif word_array.length == 0
				return "Please enter at least one letter."

			else
				word_array.each do |letter|
					if ("a".."z").include?(letter)
						letter_score = Scrabble.value_of(letter)

						word_score += letter_score
					else
						return "This game only includes letters a-z."
					end
				end
					return word_score
			end
		end

		def self.multi_score(array_of_words)
			hash_of_word_scores = {}

			array_of_words.each do |word|
				word_score = Scrabble.score(word)
				hash_of_word_scores.merge!(word => word_score)
			end

			return hash_of_word_scores
		end

		def self.highest_score_from(array_of_words)
			hash_of_word_scores = Scrabble.multi_score(array_of_words)

			hash_of_word_scores.each do |word, score|
				if 
			end



			# winner = hash_of_word_scores.max_by{|word,score| score}

		end


	end # end Scrabble class

end # end Scrabble module
