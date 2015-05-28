module Scrabble

  class Scrabble
    # SCORE is constant within the class-- tiles always have the same value
    SCORE = {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1,
             "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
             "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3,
             "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4,
             "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" =>10,
             "z" => 10}


    def self.score(word)
      total_points = 0
      # check to see that the input is actually a string (not nil or a number)
      raise ArgumentError.new "You can only use strings" unless word.class == String

      # check that the string only contains valid English letters, no numbers or symbols, controls for case
      word_array = word.chars.map { |each| each.downcase}
      raise ArgumentError.new "You can only use standard English letters" unless word_array.all? { |letter| SCORE[letter] }

      # check that the string is between 1 and 7 letters
      raise ArgumentError.new "You must play between 1 and 7 letters" unless word_array.length >= 1 && word_array.length <= 7

      # Finally a valid word! Assigning a point value to each letter in the array
      word_array.each do |letter|
        points = SCORE[letter]
        # adds points for each letter to a total_points variable
        total_points += points
      end
      return total_points
    end


    def self.highest_score_from(array_of_words)
    # transforms array_of_words into words_hash where key == word and value == word score
    words_hash = Hash[array_of_words.map {|word, total_points| [word, self.score(word)]}]

    # finds what the highest score is for the provided array of words
    highest_score = words_hash.values.max

    # iterates through the hash and returns an array of ALL the words that have the highest score
    # this prevents only the first highest score from being returned (issue with max_by)
    max_words = words_hash.select {|k, v| v == highest_score}.keys

    # sorts the array by the length of the words
    max_words = max_words.sort_by(&:length)

    # creates a length array in order to handle the case of a 7-letter word
    length = []
    max_words.map {|word| length << word.length }

    # if/else block to return the correct word in cases of matching highest score
      if max_words.length == 1
        return max_words[0] # returns the word if there is only one

      elsif length.include? 7
        return max_words[-1] #returns the last element-- why the array was sorted before

      else
        return max_words.min_by(&:length) # returns the shortest word if have no 7-letter word
      end
    end
  end
end
