module Scrabble
  CHARACTER_VALUES = {
    1  => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2  => ["D", "G"],
    3  => ["B", "C", "M", "P"],
    4  => ["F", "H", "V", "W", "Y"],
    5  => ["K"],
    8  => ["J", "X"],
    10 => ["Q", "Z"]
  }

  class Scrabble

    def self.score(word)
      word = word.upcase.split("")
      score = 0

      word.each do |letter|
        CHARACTER_VALUES.each do |score_value, characters|
          if characters.include?(letter)
            score += score_value
          end
        end
      end

      return score
    end

    def self.highest_score_from(array_of_words)
    end

  end
end
