module Scrabble
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
      @plays_array = []
    end

    def plays
      return @plays_array
    end

    def play(word)
      @plays_array << word
      return false if won?
    end

    def total_score
      sum = 0
      @plays_array.each do |word|
        sum += Scrabble::Scrabble.score(word)
      end
      return sum
    end

    def won?
      if total_score >= 100
        true
      else
        false
      end
    end

    def highest_scoring_word
      return Scrabble::Scrabble.highest_score_from(@plays_array)
    end

    def highest_word_score
      return Scrabble::Scrabble.score(Scrabble::Scrabble.highest_score_from(@plays_array))
    end

# self.new(name): creates a new instance with the instance variable name assigned
# #name: returns the @name instance variable
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# #total_score: Sums up and returns the score of the players words
# #won?: If the player has over 100 points, returns true, otherwise returns 'false'
# #highest_scoring_word: Returns the highest scoring word the user has played.
# #highest_word_score: Returns the highest_scoring_word score.
  end
end
