require 'awesome_print'

module Scrabble

  class Scrabble
    SCORE = {
      "a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1, "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1, "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3, "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4, "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" => 10, "z" => 10
    }

    def initialize

    end

    def self.score(word)
    # this is where point_conversion happens
      total_points = 0
      word = word.split(//)
      #This is for testing
      # ap word
      word.each do |input|
        points = SCORE[input]
          total_points += points
        #puts points
      end
        return total_points
    end

    def self.highest_score_from(array_of_words)
      scored_words = {}
      array_of_words.each do |word|
        scored_words[word] = self.score(word)
      end
      ap scored_words
      winner_word = scored_words.max_by{ |word, score|
       score
      }
       return winner_word[0]
        # score > score
        #  return winner_word = word
        #elsif score == score
        #  scored_words.keys.min_by do |x|
        #    x.length
        #    return winner_word = x
        #  end
        #end
        puts "Of the words #{scored_words.keys}, '#{winner_word}' scores the highest!"
    end

  end

end
