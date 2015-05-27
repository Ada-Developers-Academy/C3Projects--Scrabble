module Scrabble

  # This is a Scrabble scoring system

  SCORE_TABLE =   {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10,
  }

  class Scrabble

    #Turns the word into an array
    def self.split_word(word)
      letters = word.upcase.split(//)
    end

    def self.convert_scores(word)
      tile_scores = []
      letter_array = split_word(word)
      letter_array.each do |letter|
        tile_scores.push(SCORE_TABLE[letter])
      end
        # Now create the sum of the array
      sum = 0
      tile_scores.each do |score|
        sum += score
      end
      return sum
    end


    def self.score(word)
      #Guard clauses
      return "Not a word!" unless word.to_i == 0
      return "Yeah, silence is golden. But I still need a word" if word == nil || word == ""

      split_word(word)
      convert_scores(word)
    end

    def self.highest_score_from(array_of_words)

    end

  end

end
