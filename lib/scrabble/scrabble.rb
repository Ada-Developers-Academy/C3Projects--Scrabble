module Scrabble
  class Scrabble


    # would have preferred to nest letters in array as hash values
    TILE_VALUES = {
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
      "Z" => 10
    }


    def self.score(word)

      stripped_word = word.gsub(/\W+/, '')
      word_tiles = stripped_word.upcase.split(//)
      if word_tiles.length > 7
        return nil
      end

      scores = []
      word_tiles.each do |letter|
        if TILE_VALUES.has_key?(letter)
          scores << TILE_VALUES[letter]
        end
      end
      # sum values of letters to score word
      return scores.reduce(:+)
    end # end method self.score


    def self.highest_score_from(array_of_words)

      best_word = ""

      array_of_words.each do |word|

        self.score(word)

        # if first run, set best to first
        if best_word == ""
          best_word = word
        # prefer first highest scoring word
        elsif self.score(best_word) < self.score(word)
          best_word = word
        # if scores equal, compare lengths
        elsif self.score(best_word) == self.score(word)
            # prefer first word to use 7 tiles
            if best_word.length == 7
              # return best_word
            # then prefer first word with fewest tiles
            elsif best_word.length < word.length
              # return best_word
            elsif best_word.length > word.length
              best_word = word
            end
        end

      end # end iteration array_of_words

      return best_word

    end # end method self.highest_score_from


  end # end class Scrabble
end # end module Scrabble
