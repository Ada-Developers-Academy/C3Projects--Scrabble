module Scrabble

  class Player

    attr_accessor :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @won = false
      @total_score = 0
    end

    def play(word)
      @plays.push(word)
    end

    def total_score     # This method doesn't work! I got as far as making it, but not as far as making it work.
      @plays.each do |word|
      @total_score += (Scrabble::Scrabble.score(word))
      end
      return @total_score
    end

    # def won
    #   if
    # end

  end

end
