module Scrabble
  class Player
    attr_accessor :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays.push(word)
    end

    def total_score
      final_score = 0
      @plays.each do |word|
        final_score += Scrabble.score(word)
      end

      return final_score
    end
  end
end
