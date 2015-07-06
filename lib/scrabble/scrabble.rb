module Scrabble

  class Scrabble
    # set letter to point values
    CONVERSIONS = [
      [1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]],
      [2, ["D", "G"]],
      [3, ["B", "C", "M", "P"]],
      [4, ["F", "H", "V", "W", "Y"]],
      [5, ["K"]],
      [8, ["J", "X"]],
      [10, ["Q", "Z"]]
    ]

    def self.valid_word?(word)
      letters_of_word = word.upcase.split(//)
      if letters_of_word.any? {|letter| false == ("A".."Z").include?(letter)}
        return valid_input = false
      else
        return valid_input = true
      end
    end

    # scores a single word to point value
    def self.score(word)
      total_points = 0
      if self.valid_word?(word) == false
        return "INVALID INPUT"
      else
        word.upcase.split(//).each do |letter_in_word|
          point = self.letter_to_point(letter_in_word)
          total_points += point
        end
      end
      return total_points
    end

   # returns the highest scoring word from an array of words
   # "*" allows input to be changed to an array
   def self.highest_score_from(*array_of_words)
     word_value_pairs = []
     (array_of_words).each do |word_from_array|
       # score is a point value for single word
       if self.valid_word?(word_from_array) == false
         return "INVALID INPUT"
       else
         score = self.score(word_from_array)
         # creates an array of arrays
         word_value_pairs << [score, word_from_array]
       end
     end
     # hash with points as key and array of words with that point as value
     score_to_word_hash = word_value_pairs.group_by { |pairs| pairs[0] }
     # finds highest scoring array returned as array of arrays
     highest_words = score_to_word_hash.max_by{|score, pair| score}
     # flatten to single array and eliminates point values
     highest_words.flatten!.keep_if{|element| element.class == String}
     # returns array of 2 words = shortest and longest
     shortest, longest = highest_words.minmax_by {|word| word.length}
     if longest.length == 7
       return longest
     else
       return shortest
     end
   end

    # scores single letter to point
    def self.letter_to_point(letter)
      CONVERSIONS.find do |point, letter_array|
        if letter_array.include?(letter.upcase)
          return point
        end
      end
    end


  end
end
