module Scrabble

  class Scrabble
    # Set constants with general error message, point values of each letter, all letters
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

    LETTERS = ("a".."z").to_a

    # attr_accessor :score, :word_array
    #
    # def initialize
    #   @score = 0
    #   @word_array = []
    # end

    # def self.get_points(word)
    #
    # end

    def self.score(word)
      # convert to string, make letters lower case, & push letters to array
      word = word.to_s.downcase
      word_array = word.split("").push

      # set initial value of score
      score = 0

      # guard against empty, nil, or invalid parameter
      if word == "" || word == nil || word.split("").all? { |letter| !LETTERS.include?(letter) }
        WORD_ERROR

      else
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

end
