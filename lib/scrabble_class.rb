module Scrabble
  class Scrabble
    SCORE = {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1,
             "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
             "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3,
             "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4,
             "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" =>10,
             "z" => 10}

    # def initialize
    # end

    def self.score(word)
      total_points = 0
      word_array = word.chars.map { |ch| ch.downcase}
      word_array.each do |letter|
        points = SCORE[letter]
          total_points += points
          puts points
        end
        return total_points 
      end
    #   # word= word.split(//)
    #   # word = score_assignment(word)
    #   # letter = point,
    # end

    # def score_assignment
    #     # SCORE.find_all do |letter, point|
    #     #   ap letter
    #     #   ap point
    #     # end
    #     puts SCORE[0]
    #     puts SCORE[1]
    # end
          # word.each do |input|
          #   if input == letter
          #   return letter = point
          #   point += total_points
          #   # puts letter
          # # else
          # #   "Please enter a word"
          #   end
          #   puts total_points
          # end
    #     end
    # end

    def self.highest_score_from(array_of_words)
    end


  end
end
