module Scrabble #require your gems and classes here # require_relative 'scrabble/whatevs'

  SCOREBOARD = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
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

    def self.letters_in_word(word)
      return word.split(//)
    end

    def self.convert_letter_score(word)
      score_array = []
      split_letter_array = letters_in_word(word) #assign word.split array to variable
      split_letter_array.each do |letter|
        score_array.push(SCOREBOARD[letter.upcase])
      end

      sum = 0
      score_array.each do |score| #how to tell letter & score?
        sum += score #combine letter & score?
      end
      return sum
    end


  end

end
