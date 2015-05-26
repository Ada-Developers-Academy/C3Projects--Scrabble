module Scrabble
  # require your gems and classes here
  # hash for keep tracking of point value for each letter

  class Scrabble
    # hash to hold point value => corresponding letters w/ point value
    SCORE_CHART = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"]
    }

    # method to determine score of individual letter
    def self.score_letter(letter)
      # runs through the SCORE_CHART hash
      SCORE_CHART.each do |point_value, corresponding_letters|
        # if the inputted letter matches up with a letter in the array, then return the corresponding point value
        if corresponding_letters.include?(letter)
          return point_value
        end
      end
    end

    # method to return the total score of a word
    def self.score(word)
      # ensures entire string is uppercase
      word = word.upcase

      # initialize total score of the word to zero
      total_word_score = 0

      # splits the word into single letters and loops through each letter
      word.split("").each do |letter|
        # gets the score value for the letter and adds it to the total word score
        letter_score = self.score_letter(letter)
        total_word_score += letter_score
      end

      return total_word_score
    end
    

  end
end
