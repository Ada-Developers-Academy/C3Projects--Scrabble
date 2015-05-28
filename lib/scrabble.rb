module Scrabble
#   # require your gems and classes here
#   # require_relative 'scrabble/whatevs'
VALUES = {"a"=> 1, "b"=> 3, "c"=> 3, "d"=> 2, "e"=> 1, "f"=> 4, "g"=> 2, "h"=> 4, "i"=> 1, "j"=> 8, "k"=> 5, "l"=> 1, "m"=> 3, "n"=> 1, "o"=> 1, "p"=> 3, "q"=> 10, "r"=> 1, "s"=> 1, "t"=> 1, "u"=> 1, "v"=> 4, "w"=> 4, "x"=> 8, "y"=> 4, "z"=> 10}

  class Scrabble


    def self.score(word)
      if word.length > 7 || word.length < 1
        return "Error"
      end

      word_score = []
      #word_array = word.downcase.split(//) # makes an [] with each letter as its own element
      word.downcase.each_char do |letter|
        VALUES.each do |key, value|
          if letter == key
            word_score.push(value)
          end
        end
      end

      score = word_score.reduce(0, :+)
      return score
    end

    def self.highest_score_from(array_of_words)
      array_of_values = []
      array_of_words.collect do |word|
        values = self.score(word)
        array_of_values.push(values)
      end
      # return array_of_values
      hash_of_words = Hash[array_of_words.zip array_of_values]#return hash_of_words

      grouped_hash = hash_of_words.group_by { |k,v| v} # groups by value
      grouped_hash = grouped_hash.max[1] # makes a hash of elements with the max value
      # put stuff here to make sure shortest word is returned if same highest score
      grouped_keys = grouped_hash.sort_by { |k,v| k.length} # groups keys by length
      longest_key = grouped_keys.max[0]

      if longest_key.length == 7
        return longest_key
      else
      highest_score = grouped_hash.min_by { |k,v| k.length}[0]
      #highest_score = hash_of_words.max_by { |k,v| v }[0]
      return highest_score
    end
    end

  end
end
