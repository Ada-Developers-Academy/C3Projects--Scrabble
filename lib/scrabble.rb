module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  class Scrabble
    attr_accessor :score_chart

    def initialize
      @score_chart = [
        [1, "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        [2, "D", "G"],
        [3, "B", "C", "M", "P"],
        [4, "F", "H", "V", "W", "Y"],
        [5, "K"],
        [8, "J", "X"],
        [10, "Q", "Z"]
      ]
    end

    def self.score(word)
      # the complex if statement verifies if the input is correct e.g. :
      # it's not a number
      # the word contains 7 or less letters
      # there is no spaces between letters
      if (word.to_i.class == Fixnum && (word.to_i != 0 || word != "0")) || (word.length > 7 || word.split() != [word])
         return "Error"
       else
         word = word.upcase
      end

      



    end
  end
end
