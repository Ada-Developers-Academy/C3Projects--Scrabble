POINTS = [
  ["A", 1], ["E", 1], ["I", 1], ["O", 1], ["U", 1],
  ["L", 1], ["N", 1], ["R", 1], ["S", 1], ["T", 1],
  ["D", 2], ["G", 2],
  ["B", 3], ["C", 3], ["M", 3],
  ["F", 4], ["H", 4], ["V", 4], ["W", 4], ["Y", 4],
  ["K", 5],
  ["J", 8], ["X", 8],
  ["Q", 10], ["Z", 10]
]

module Scrabble
 
  class Score

    def self.score(word)
      word = word.upcase.chars
      score = 0
      POINTS.each do |letter, points|
        word.each do |word_letter|
          if word_letter == letter
            score = score + points
          end
        end
      end
      return score

      puts "You received #{score} points for #{word}."
    end

    def self.highest_score_from(array_of_words)
      # returns the word in the array with the highest score
      # choose word with fewer tiles, unless all 7 tiles are used
      # if multiple words with same score, choose first one in the list
    end
  end
  # require_relative 'scrabble/whatevs'
end
