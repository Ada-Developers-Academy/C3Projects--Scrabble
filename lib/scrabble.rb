module Scrabble

	class Scrabble
	  # require your gems and classes here
	  # require_relative 'scrabble/whatevs'
	  
	  SCORES = {
	  	1 	=> "aeioulnrst",
	  	2 	=> "dg",
	  	3 	=> "bcmp",
	  	4 	=> "fhvwy",
	  	5 	=> "k",
	  	8 	=> "jx",
	  	10 	=> "qz"
	  }

	  def initialize
	  end

	  def self.score(word)
	  	word_score = 0
	  	word_letters = word.downcase.split("")
	  	# puts word.split("").class
	  	word_letters.each do |letter|
			SCORES.each do |points, letter_list|
				if letter_list.include?(letter)
					word_score += points
				end
			end
	  	end
	  	word_score
	  end


	  def self.highest_score_from(list_of_words)
	  	all_scores = []
	  	list_of_words.each do |word|
	  		all_scores << [Scrabble.score(word), word]
	  	end
	  	return all_scores.max.last
	  end

	end
end
