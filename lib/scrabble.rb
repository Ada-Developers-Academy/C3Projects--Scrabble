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

    # one_point_letters = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    # two_point_letters = ["D", "G"]
    # three_point_letters = ["B", "C", "M", "P"]
    # four_point_letters = ["F", "H", "V", "W", "Y"]
    # five_point_letters = ["K"]
    # eight_point_letters = ["J", "X"]
    # ten_point_letters = ["Q", "Z"]
    #
    # one_point = Hash.new {|hash, key| hash[key] = 1}
    # two_points = Hash.new {|hash, key| hash[key] = 2}
    # three_points = Hash.new {|hash, key| hash[key] = 3}
    # four_points = Hash.new {|hash, key| hash[key] = 4}
    # five_points = Hash.new {|hash, key| hash[key] = 5}
    # eight_points = Hash.new {|hash, key| hash[key] = 8}
    # ten_points = Hash.new {|hash, key| hash[key] = 10}
    #
    # one_point_letters.each do |letter|
    #   one_point[letter]
    # end
    # ONE = one_point  # should look like {"A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1}

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
      best_word = array_of_words[0]

      array_of_words.each do |word|
        if score(best_word) < score(word)
          best_word = word
        elsif score(best_word) == score(word)
          if best_word.length == 7 && word.length == 7
            best_word = best_word
          elsif best_word.length < 7 && word.length == 7
            best_word = word.upcase
          elsif best_word.length == 7 && word.length < 7
            best_word = best_word
          elsif best_word.length > word.length
            best_word = word.upcase
          end
        end
      end

      return best_word
    end

    # CHECKS FOR EDGE CASES OF THE WORD
    def self.valid?(word)
      return false if word == nil
      return false if word.length < 1
      return false if word.length > 7

      word.upcase!
      valid_letters = ("A".."Z")

      word.each_char do |char|
        return false unless valid_letters.include?(char)
      end
    end

    def self.valid_array?(array_of_words)
      return false if array_of_words.class != Array
      return false if array_of_words == nil
      return false if array_of_words.length < 1
    end

    # Note that it’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters.
    # Note that there is a greater bonus for using all seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    # If the there are multiple words that are the same score and same length, pick the first one in supplied list
  end # class Scrabble

end # module Scrabble
