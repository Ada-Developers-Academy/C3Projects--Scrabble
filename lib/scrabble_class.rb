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
      word.each do |input|
        points = SCORE[input]
        total_points += points
      end
        return total_points
    end

    def self.highest_score_from(array_of_words)
      scored_words = {}
      array_of_words.each do |word|
        scored_words[word] = self.score(word)
      end
      if scored_words.empty?
        return "Provide words please"
      end
        #because max_by automatically selects the first key value pair that fulfills it's requirements, I wanted to make sure that was also the smallest word by first sorting the array by the word.length and assigning it to an independent variable sorted_words

      sorted_words = scored_words.sort_by do |word, score|
        word.length
      end

      seven_words = []
      sorted_words.each do |word|
        if word[0].length == 7
          seven_words.push(word)
        end
      end

      seven_winner = seven_words.max_by do |word|
        word[1]
      end

      winner_word = sorted_words.max_by do |word, score|
        score
      end

      #implicitly handles words over 7 characters
      if seven_winner
        if winner_word[1] == seven_winner[1] || seven_winner[1] > winner_word[1]
          winner_word = seven_winner
        end
      end


      puts "Of the words #{scored_words.keys}, '#{winner_word[0]}' is the winner!"
      return winner_word[0]
    end
  end

end
