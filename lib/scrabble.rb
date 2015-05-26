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
  	# puts word.split("").class
  	word.split("").each do |letter|
		SCORES.each do |points, letter_list|
			if letter_list.split("").include?(letter)
				word_score += points
			end
		end
  	end
  	word_score
  end
end
