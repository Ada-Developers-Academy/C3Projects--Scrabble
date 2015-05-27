module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  # constant scoring for scrabble
 LETTERS = {
   1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
   2=> ["D", "G"],
   3=> ["B", "C", "M", "P"],
   4=> ["F", "H", "V", "W", "Y"],
   5=> "K",
   8=> ["J", "X"],
   10=> ["Q", "Z"]
 }

  class Scrabble
    # confirming that input is valid, only accepting letters
    # def self.is_valid?(word)
    #   return "error"
    # end

    def self.score(word)
      # make everything uppercase to compare to contant scoring
      # ********* why doesn't word = word.upcase! ***********
      word.upcase!
      # calling the validating method
      # is_valid?(word)
      # splitting word into an array of letters
      input_letters = word.split(//)
      total_points = 0

      # for each letter in the input_letters array, iterate over it

      input_letters.each do |letter|
        LETTERS.each do |points, letters|
          # for each key/value in LETTERS constant, iterate over this
          # if the input_letters letter matches the LETTERS letters in the value,
          # then add the points key to total_points
          if letters.include?(letter)
            total_points += points
          end
        end
      end

      return total_points
    end

    def self.highest_score_from(array)
      score_array = []
      array.each do |word|
        word_score = Scrabble.score(word)
        score_array.push(word_score)
      end

      # make below a loop
      if score_array[1] > score_array[0]
        return array[1]
      end

    end

  end

end
