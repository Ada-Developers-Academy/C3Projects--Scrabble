module Scrabble

  class Scrabble
    WORD_ERROR = "ERROR: Please enter a word."
    POINTS = {
      1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
      2 => ["d", "g"],
      3 => ["b", "c", "m", "p"],
      4 => ["f", "h", "v", "w", "y"],
      5 => ["k"],
      6 => ["j", "x"],
      7 => ["q", "z"]
    }

    # attr_accessor :score, :word_array
    #
    # def initialize
    #   @score = 0
    #   @word_array = []
    # end



    def self.score(word)
      return WORD_ERROR if word == "" || word == nil
      word = word.downcase
      # if word == "a" || word == "e"
      #   @score = 1
      #   return @score
      # end
      score = 0
      word_array = word.split("").push

      word_array.each do |letter|
        if POINTS[1].include?(letter)
          score += 1
        end

        if POINTS[2].include?(letter)
          score += 2
        end

        if POINTS[3].include?(letter)
          score += 3
        end

        if POINTS[4].include?(letter)
          score += 4
        end

        if POINTS[5].include?(letter)
          score += 5
        end

        if POINTS[6].include?(letter)
          score += 6
        end

        if POINTS[7].include?(letter)
          score += 7
        end

      end
      return score

    end

  end

end
