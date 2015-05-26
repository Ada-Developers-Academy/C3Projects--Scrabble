module Scrabble
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

  def self.score(word)

	SCORES.each do |score, letter_list|
		if letter_list.split("").include?(word)
			return score
		end
	end

  end

  # puts SCORES[1]

end
