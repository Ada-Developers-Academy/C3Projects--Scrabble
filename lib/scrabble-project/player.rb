module Scrabble

  class Player

    attr_accessor :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @won = false
      @total_score = 0
    end

    def play(word)
      @plays.push(word)
      return @plays
    end

    def total_score
      @plays.each do |word|
      (Scrabble::Scrabble.score(word))
      @total_score += word.score
      end
      return @total_score
    end

    # def won
    #   if
    # end

  end

end
