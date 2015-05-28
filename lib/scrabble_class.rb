module Scrabble
  class Scrabble
    attr_accessor :total_points, :word
    SCORE = {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1,
             "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
             "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3,
             "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4,
             "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" =>10,
             "z" => 10}

    # def initialize
    # end

    def self.score(word)
      total_points = 0
      # check to see that the input is actually a string (not nil or a number)
      raise ArgumentError.new "You can only use strings" unless word.class == String

      # check that the string only contains valid English letters, no numbers or symbols
      word_array = word.chars.map { |each| each.downcase}
      raise ArgumentError.new "You can only use standard English letters" unless word_array.all? { |letter| SCORE[letter] }

      #assigning a point value
      word_array.each do |letter|
        points = SCORE[letter]
        total_points += points
        # puts points
      end
      return total_points
    end


    def self.highest_score_from(array_of_words)
    equal_words = []
    words_hash = Hash[array_of_words.map {|word, total_points| [word, self.score(word)]}]
    max_quantity = words_hash.values.max
    max_words = words_hash.select {|k, v| v == max_quantity}.keys
      if max_words.length == 1
        return max_words[0]
      else
        return max_words
      end
    end




  end
end
