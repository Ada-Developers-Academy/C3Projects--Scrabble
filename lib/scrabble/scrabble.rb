module Scrabble

  class Scrabble
    CONVERSIONS = [
      [1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]],
      [2, ["D", "G"]],
      [3, ["B", "C", "M", "P"]],
      [4, ["F", "H", "V", "W", "Y"]],
      [5, ["K"]],
      [8, ["J", "X"]],
      [10, ["Q", "Z"]]
    ]

    def initialize
      @array_of_words = ["stop", "go", "peanut", "candy", "zoo", "sailing"]
    end

    def self.score(word)
      total_points = 0
      word.split.each do |letter|
        letter_to_point(letter)
        total_points += point
      end
      return total_points
    end

    def self.highest_score_from(array_of_words)
      
    end

    def letter_to_point(letter)
      CONVERSIONS.find do |point, letter_array|
        if letter_array.include?(letter)
          return point
        end
      end
    end


  end
end
