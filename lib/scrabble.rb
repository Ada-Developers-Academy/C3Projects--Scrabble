module Scrabble
  class Scrabble

    CONVERSIONS = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 8,
      "Y" => 4,
      "Z" => 10,
    }

    def self.score (word)
      sum = 0
      word = word.upcase
      word.split(//).each do |letter|
        sum = sum + CONVERSIONS[letter]
      end
      return sum
    end

    def self.highest_score_from(array_of_words)
      high_score = 0
      high_score_word = nil
      array_of_words.each do |word|
#        puts "word = #{word}"
        current_score = self.score(word)
#        puts "current_score = #{current_score}"
        if current_score > high_score
#          puts "#{current_score} > #{high_score} so update"
          # Update the current high score
          high_score = current_score
          high_score_word = word
        elsif current_score == high_score
          # We've got a tie
#          puts "#{current_score} == #{high_score} so tie"
          if (
            # current word is shorter (and high score word doesn't use all 7 tiles)
            word.length < high_score_word.length && high_score_word.length != 7) ||
            # current word uses all 7 tiles (and high score word doesn't use all 7 tiles)
            (word.length == 7 && high_score_word.length < 7)
#            puts "#{word.length} < #{high_score_word.length} so we probably want to update"
            # Update the current high score
            high_score = current_score
            high_score_word = word
          end
        end
      end
      return high_score_word
    end
  end
end
