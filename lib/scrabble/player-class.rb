module Scrabble
  class Player
    attr_accessor :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    # Adds played words to [] and returns the array or returns false if won
    def play(word)
      if won? == false
        @plays.push(word)
      else
        return false
      end
    end

    # Returns total score of all words in []
    def total_score
      final_score = 0
      @plays.each do |word|
        final_score += Scrabble.score(word) # adds score of each word to total score
      end

      return final_score
    end

    # Returns true or false based on if user has won or not
    def won?
      if total_score >= 100
        return true
      else
        return false
      end
    end

    # Returns the highest scoring word in []
    def highest_scoring_word
      return Scrabble.highest_score_from(@plays)
    end

    # Returns the score of the highest scoring word in []
    def highest_word_score
      return Scrabble.score(highest_scoring_word)
    end
  end
end
