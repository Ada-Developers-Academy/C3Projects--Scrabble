module Scrabble
#   # require your gems and classes here
#   # require_relative 'scrabble/whatevs'
VALUES = {"a"=> 1, "b"=> 3, "c"=> 3, "d"=> 2, "e"=> 1, "f"=> 4, "g"=> 2, "h"=> 4, "i"=> 1, "j"=> 8, "k"=> 5, "l"=> 1, "m"=> 3, "n"=> 1, "o"=> 1, "p"=> 3, "q"=> 10, "r"=> 1, "s"=> 1, "t"=> 1, "u"=> 1, "v"=> 4, "w"=> 4, "x"=> 8, "y"=> 4, "z"=> 10}

  class Scrabble


    def self.score(word)
      #letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
      if word.length > 7 #|| letters.each { |letter| word.include?(letter) == false}
        return "Error"
      end
      # return "Error" if (word.length > 7) || if word.include?(letters) == false

      word_score = []
      #word_array = word.downcase.split(//) # makes an [] with each letter as its own element

      word.each_char do |letter|
        VALUES.each do |key, value|
          if letter == key
            word_score.push(value)
          end
        end
      end
      score = word_score.reduce(0, :+)
      return score




    end
  end
end
