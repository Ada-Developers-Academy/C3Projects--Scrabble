module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

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
      return 0 if word.length > 7  # "guard clause" for zero

      word_array = word.upcase.split(//)  # breaks word into an array of letters
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
      best_word = array_of_words[0].upcase

      array_of_words.each do |word|
        if score(best_word) < score(word)
          best_word = word.upcase
        elsif score(best_word) == score(word)
          if best_word.length == 7 && word.length == 7
            best_word = best_word.upcase
          elsif best_word.length < 7 && word.length == 7
            best_word = word.upcase
          elsif best_word.length == 7 && word.length < 7
            best_word = best_word.upcase
          elsif best_word.length > word.length
            best_word = word.upcase
          end
        end
      end

      return best_word
    end

    # Note that it’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters.
    # Note that there is a greater bonus for using all seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    # If the there are multiple words that are the same score and same length, pick the first one in supplied list
  end # class Scrabble

end # module Scrabble
