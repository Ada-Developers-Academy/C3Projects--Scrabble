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

    array_of_words = ["shotgun", "stop", "go", "peanut", "candy", "zoo", "sailing"]

    def self.score(word)
      total_points = 0
      word.split(//).each do |letter_in_word|
        point = self.letter_to_point(letter_in_word)
        total_points += point
      end
      return total_points
    end

  #  def self.highest_score_from(array_of_words)
  #    (array_of_words).each do |word_from_array|
  #      self.score(word_from_array)
  #    end
  #  end

    def self.letter_to_point(letter)
      CONVERSIONS.find do |point, letter_array|
        if letter_array.include?(letter)
          return point
        end
      end
    end


  end
end
