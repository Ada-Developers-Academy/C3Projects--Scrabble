module Scrabble
  # require your gems and classes here

  # hash for keep tracking of point value for each letter

  class Scrabble

    # hash to hold point value => corresponding letters
    SCORE_CHART = {
      1  => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2  => ["D", "G"],
      3  => ["B", "C", "M", "P"],
      4  => ["F", "H", "V", "W", "Y"],
      5  => ["K"],
      8  => ["J", "X"],
      10 => ["Q", "Z"]
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
        letter_score = score_letter(letter)
        total_word_score += letter_score
      end

      return total_word_score
    end


    # method to determine which word from an array has the highest score
    def self.highest_score_from(array_of_words)
      # create hash using given array
      # ["cat", "dog"] => {total_points: "cat", total_points: "dog"}
      word_points_hash = array_of_words.group_by {|word| score(word)}

      # sorts through the keys in the hash to find largest point value
      # returns an array of word(s) that have the largest point value
      # .max_by returns an array like so: [4, ["cat", "dog"]]
      # need to use index [1] to access just the words
      highest_scoring_words = word_points_hash.max_by {|k, v| k }[1]

      # if array of words contains more than one element
      if highest_scoring_words.length > 1

        # go through each element in the array
        highest_scoring_words.each do |word|
          # if the word has 7 letters, return this word
          if word.length == 7
            return word
          end
        end

        # otherwise, return the word in the array with the least amount of letters
        # this also returns the first instance in the array with the least amount of letters
        return highest_scoring_words.min_by {|word| word.length}

      # if the array does not contain more than one element, just return the first/only element
      else
        highest_scoring_words[0]
      end
    end


  end
end
