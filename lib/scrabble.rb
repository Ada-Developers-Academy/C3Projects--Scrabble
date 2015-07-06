module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'
  class Scrabble

    def self.score(word)
      value = { 
                 1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
                 2 => ["d", "g"], 
                 3 => ["b", "c", "m", "p"],
                 4 => ["f", "h", "v", "w", "y"],
                 5 => ["k"],
                 8 => ["j", "x"],
                 10 => ["q", "z"]
                }

      count = 0
        word_array = word.to_s.downcase.split(//)
        return "too many letters" if word_array.length > 7 
        return "error" if word.to_s.strip.empty?
        word_array.each do |l|
          if ("a".."z").include?(l) 
            value.select do |k, v|
              if v.include?(l)
                count += k
              end
            end
          else
            return "error"
          end
        end
        return count
    end

    def self.highest_score_from(array_of_words)
      winner_word = []
      high_score = 0
      array_of_words.each_with_index do |word, index|
        score = self.score(word)
        if score > high_score
          winner_word.replace([word])
          high_score = score
        elsif score == high_score
          # if winner_word[0].length == 7
          #   return winner_word[0]
          if winner_word[0].length == word.length
            winner_word_index = array_of_words.index(winner_word[0])
            word_index = array_of_words.index(word)
            index = [winner_word_index, word_index].min 
            puts index
            return array_of_words[index]
          elsif word.length == 7
            return word
          elsif winner_word[0].length > word.length && winner_word[0].length != 7
            return word
          end
        end
      end
      return winner_word.pop
    end

  end
end
