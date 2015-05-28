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

  end
end
