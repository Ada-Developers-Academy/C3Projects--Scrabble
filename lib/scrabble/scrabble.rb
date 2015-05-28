module Scrabble
  class Scrabble

    ONE_POINT = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    TWO_POINTS = ["D", "G"]
    THREE_POINTS = ["B", "C", "M", "P"]
    FOUR_POINTS = ["F", "H", "V", "W", "Y"]
    FIVE_POINTS = ["K"]
    EIGHT_POINTS = ["J", "X"]
    TEN_POINTS = ["Q", "Z"]

    # RETURNS THE SCORE OF THE WORD
    def self.score(word)
      return 0 if valid?(word) == false
      word.upcase!  # done so I don't need to .upcase every time

      word_array = word.split(//)  # breaks word into an array of letters
      score = 0

      # Adds respective value to score if letter is included in the constant.
      word_array.each do |letter|
        score += 1 if ONE_POINT.include?(letter)
        score += 2 if TWO_POINTS.include?(letter)
        score += 3 if THREE_POINTS.include?(letter)
        score += 4 if FOUR_POINTS.include?(letter)
        score += 5 if FIVE_POINTS.include?(letter)
        score += 8 if EIGHT_POINTS.include?(letter)
        score += 10 if TEN_POINTS.include?(letter)
      end

      return score
    end

    # RETURNS THE WORD IN THE ARRAY WITH THE HIGHEST SCORE
    def self.highest_score_from(array_of_words)
      return 0 if valid_array?(array_of_words)

      array_of_words.each { |word| word.upcase! }  # upcase every word
      highest_scoring_word = array_of_words[0]

      array_of_words.each do |word|
        if score(highest_scoring_word) < score(word)      # checks if the score of the highest scoring word is less than the word
          highest_scoring_word = word                     # if so, make the word the new highest scoring word
        elsif score(highest_scoring_word) == score(word)  # if the scores of the words are equal
          if highest_scoring_word.length < 7 && word.length == 7
            highest_scoring_word = word
          elsif highest_scoring_word.length == 7 && word.length < 7
            highest_scoring_word = highest_scoring_word # redunant I know, easier for me to undestand the logic
          elsif highest_scoring_word.length > word.length
            highest_scoring_word = word
          end
        end
      end

      return highest_scoring_word
    end

    # CHECKS FOR EDGE CASES: CHECKS TO MAKE SURE THE WORD IS A VALID WORD
    def self.valid?(word)
      return false if word.class != String
      return false if word == nil
      return false if word.length < 1
      return false if word.length > 7

      word.upcase!
      valid_letters = ("A".."Z")

      word.each_char do |char|
        return false unless valid_letters.include?(char)
      end
    end

    # CHECKS FOR EDGE CASES: MAKES SURE THE ARRAY IS AN ARRAY & IS VALID
    def self.valid_array?(array_of_words)
      return false if array_of_words.class != Array
      return false if array_of_words == nil
      return false if array_of_words.length < 1
    end

  end # class Scrabble
end
