module Scrabble
  class Player
    attr_accessor :name, :played_words, :playing

    def initialize(name)
      @name = name
      @played_words = []
      @playing = true
    end

    def play(word)
      if @playing
        @played_words.push(word)
      else
        return false
      end
    end

    def plays
      return @played_words
    end

    def total_score
      final_score = 0

      @played_words.each do |word|
        final_score += Scrabble.score(word)
      end

      return final_score
    end

    def won?
      if total_score > 100
        @playing = false
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      Scrabble.highest_score_from(@played_words)
    end

    def highest_word_score
      Scrabble.score(self.highest_scoring_word)
    end
  end
end
