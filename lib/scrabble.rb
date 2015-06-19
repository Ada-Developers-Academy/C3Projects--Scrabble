module Scrabble

VALUES = {"a"=> 1, "b"=> 3, "c"=> 3, "d"=> 2, "e"=> 1, "f"=> 4, "g"=> 2, "h"=> 4, "i"=> 1, "j"=> 8, "k"=> 5, "l"=> 1, "m"=> 3, "n"=> 1, "o"=> 1, "p"=> 3, "q"=> 10, "r"=> 1, "s"=> 1, "t"=> 1, "u"=> 1, "v"=> 4, "w"=> 4, "x"=> 8, "y"=> 4, "z"=> 10}

  class Scrabble

    def self.score(word)
      word = word. downcase

      return "Error" if self.validate?(word) == false

      word_score = 0
      word.each_char do |letter|
        VALUES.each do |key, value|
          if letter == key
            word_score += value
          end
        end
      end

      return word_score
    end

    def self.highest_score_from(array_of_words)
      hash_of_words = {}
      array_of_words.collect do |word|
        value = self.score(word)
        hash_of_words[word] = value
      end

      grouped_hash = hash_of_words.group_by { |key, value| value} # groups by value
      grouped_hash = grouped_hash.max[1] # makes a hash of elements with the max value

      grouped_keys = grouped_hash.sort_by { |key, value| key.length} # groups keys by length from the hash of the max values
      longest_key = grouped_keys.max[0] # the longest key which should be 7 letters or less

      if longest_key.length == 7
        return longest_key
      else
        highest_score = grouped_hash.min_by { |key, value| key.length}[0] # the shortest key from the max value hash
        return highest_score
      end
    end

    private

    def self.validate?(word)

      if word.length > 7 || word.length < 1
        return false
      end

      word_array = word.split(//) # makes an [] with each letter as its own element
      word_array.each do |character|
        unless ("a".."z").include?(character)
          return false
        end
      end
    end

  end
end
