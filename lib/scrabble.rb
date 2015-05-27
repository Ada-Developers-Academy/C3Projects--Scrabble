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
    def self.is_valid?(word)
      if ["a".."z", "A".."Z"].include?(word)
        return word
      else
        return "error"
      end
    end

    def self.score(word)
      # make everything uppercase to compare to contant scoring
      # ********* why doesn't word = word.upcase! ***********
      word.upcase!
      # calling the validating method is_valid?(word)
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

    def self.highest_score_from(array_of_words)

      scrabble_hash = {}

      array_of_words.each do |word|
        score = 0

        score = word.score
        length = word.length
        scrabble_hash[word] = [score, length]
      end

      hi_score = scrabble_hash.max_by {|word, (score, length)| score}
      # returns a hash with the hi scoring key/values
      hi_score_hash = scrabble_hash.find_all {|word, (score, length)| score == hi_score}

      # returns the hash/value pair for the winning word
      winning_word = hi_score_hash.min_by {|word, (score, length)| length}

      # need to say what
      return hi_score_hash.key([winning_word])








      # word_lengths = []
      # score_array = []
      # array_of_words.each do |word|
      #   word_lengths.push(word.length)
      #   # check the score for each word in the array
      #   word_score = Scrabble.score(word)
      #   score_array.push(word_score)
      # end
      #
      # if word_lengths.include?(7)
      #   index = 0
      #   index = word_lengths.index(7)
      #   return array_of_words[index]
      #
      # else
      #
      #   hi_score = 0
      #   index = 0
      #   hi_score = score_array.max
      #   index = score_array.index(hi_score)
      #   return array_of_words[index]
      # end

    end

  end

end
