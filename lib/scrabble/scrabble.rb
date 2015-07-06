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
      return nil if word == ""

      word = word.upcase.split("")
      score = 0

      word.each do |letter|
        if %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z).include?(letter)
          CHARACTER_VALUES.each do |score_value, characters|
            if characters.include?(letter)
              score += score_value
            end
          end
        else
          return nil
        end
      end

      return score
    end

    def self.highest_score_from(array_of_words)
      scores = {}
      array_of_words.each do |word|
        scores[word] = score(word)
      end

      winning_score = scores.values.max
      # removes all pairs that don't have a winning score
      # (so weird – without winning_score, keep_if returns "cat"; same with select!)
      scores.keep_if { |key, value| value == winning_score }

      if scores.length == 1
        scores.keys[0]
      else
        scores.each { |word, score| return word if word.length == 7 }

        scores.keys.min_by { |word| word.length }
      end
    end

  end
end
