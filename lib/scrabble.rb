module Scrabble
   require "awesome_print"

  class Scrabble
    # attr_accessor :score_1, :score_2, :score_3, :score_4, :score_5, :score_8, :score_10
    SCORE_1 =  [1, "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    SCORE_2 =                                          [2, "D", "G"]
    SCORE_3 =                                [3, "B", "C", "M", "P"]
    SCORE_4 =                           [4, "F", "H", "V", "W", "Y"]
    SCORE_5 =                                               [5, "K"]
    SCORE_8 =                                          [8, "J", "X"]
    SCORE_10 =                                        [10, "Q", "Z"]

    # def initialize
    # end

    def self.score(word)
      # the complex if statement verifies if the input is correct e.g. :
      # it's not a number
      # the word contains 7 or less letters
      # # there is no spaces between letters
       if (word.to_i.class == Fixnum && (word.to_i != 0 || word == "0" || word == 0)) || (word.length > 7 || word.split() != [word])
          return "Error!"
        else
          word = word.upcase
       end

      word = word.split("")
      score = []
        word.each do |letter|
          if SCORE_1.include?(letter)
            score.push(1)
          elsif
            SCORE_2.include?(letter)
            score.push(2)
          elsif
            SCORE_3.include?(letter)
            score.push(3)
          elsif
            SCORE_4.include?(letter)
            score.push(4)
          elsif
            SCORE_5.include?(letter)
            score.push(5)
          elsif
            SCORE_8.include?(letter)
            score.push(8)
          else
            score.push(10)
          end
        end
      puts "The total score for #{word.join} is:"
      return score[0].to_i + score[1].to_i + score[2].to_i + score[3].to_i + score[4].to_i + score[5].to_i + score[6].to_i
    end
  end
end

ap Scrabble::Scrabble.score("Hello")
