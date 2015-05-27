module Scrabble

  class Scrabble
    # Set constants with general error message and point values of each letter
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

    # LETTERS = ("a".."z").to_a

    # attr_accessor :score, :word_array
    #
    # def initialize
    #   @score = 0
    #   @word_array = []
    # end

    def self.score(word)
      # error if empty string or nil
      return WORD_ERROR if word == "" || word == nil

      # make all letters lower case, then push letters to array
      word = word.downcase
      word_array = word.split("").push

      # set initial value of score
      score = 0

      # for each letter in word_array, check POINTS and add to total to create score
      word_array.each do |letter|
        for num in 1..7
          if POINTS[num].include?(letter)
            score += num
          end
        end
      end

      return score

    end

  end

end
