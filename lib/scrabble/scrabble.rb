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
      word_letters = word.upcase.split(//)
      scores = []
      word_letters.each do |letter|
        if TILE_VALUES.has_key?(letter)
          scores << TILE_VALUES[letter]
        end
      end
      # sum values of letters to score word
      return scores.reduce(:+)
    end


    def self.highest_score_from(array_of_words)
      scored_words = {}
      score = 0

      # scores each word, puts the word and it's score in a hash
      array_of_words.each do |word|
        score = self.score(word)
        scored_words[word] = score
        puts scored_words
      end
      all_scores = scored_words.values

      # for testing
      highest_scores = all_scores.find_all { |scores| scores == all_scores.max } # for testing
      puts highest_scores # for testing

      # finds and returns word(s) with maximum score(s)
      highest_words = []
      scored_words.each do |word, score|
        if score == all_scores.max
          highest_words << word
        end
      end
      return highest_words


      # score each word - DONE
      # return highest scored word - DONE
        # if scores are the same
          # count word length
            # if same length, return first
            # elsif
              # if < 7, return lowest word
              # else 7, return it
    end


    # Future methods to write to avoid a billion
    # nested if statements inside highest_score_from:
    # * method to return highest scored words
    # * method to count word lengths
    # * method to return fewest/7 letter word ...?


  end # class Scrabble
end # module Scrabble
