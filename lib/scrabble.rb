module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'
  SCORE_TABLE =   {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1
  }

  class Scrabble

    def self.score(word)
      return SCORE_TABLE[word]

    end

    def self.highest_score_from(array_of_words)
    end

  end

end
