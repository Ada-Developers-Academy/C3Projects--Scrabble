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

    def self.score(word)
      total_points = 0
      word.upcase.split(//).each do |letter_in_word|
        point = self.letter_to_point(letter_in_word)
        total_points += point
      end
      return total_points
    end

   def self.highest_score_from(*array_of_words)
     word_value_pairs = []
     (array_of_words).each do |word_from_array|
       score = self.score(word_from_array)
       word_value_pairs << [score, word_from_array]
     end
     score_to_word_hash = word_value_pairs.group_by { |pairs| pairs[0] }
     highest_words = score_to_word_hash.max_by{|score, pair| score}
     highest_words.flatten!.keep_if{|element| element.class == String}
     # FUNCTIONING 7 LETTER RETURN --------------
      highest_words.each do |word|
          if word.length == 7
            return word
          end
        end
      return highest_words[0]

    # INCORPORATE SHORTEST WORD ------------------
    #  length_pairs = []
    #  highest_words.sort_by do |word|
      #  length = word.length
      #  length_pairs << [length, word]
        # end
      #  if length_pairs[0].include?(7)
      #
      #  if array.last.length == 7
        #  return array.last
      #  else
        #  return array.first
      #  end
   end



    def self.letter_to_point(letter)
      CONVERSIONS.find do |point, letter_array|
        if letter_array.include?(letter.upcase)
          return point
        end
      end
    end


  end
end
