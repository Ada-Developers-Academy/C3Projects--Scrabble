POINT_CONVERSIONS = [
  [%w(A E I O U L N R S T), 1],
  [%w(D G), 2],
  [%w(B C M P), 3],
  [%w(F H V W Y), 4],
  [%w(K), 5],
  [%w(J X), 8],
  [%w(Q Z), 10]
]

module Scrabble
  # require your gems and classes here
  class Score

    attr_reader :score

    def initialize
      @score = 0
    end

    def self.score(word)
      @letter_array = word.split(//)
      POINT_CONVERSIONS.select do |letters, points|
        @letter_array.each do |letter|
          while letter == letters
            @score = @score + points
          end
        end
      end
      return @score
    end

    def self.highest_score_from(array_of_words)
      # returns the word in the array with the highest score
      # choose word with fewer tiles, unless all 7 tiles are used
      # if multiple words with same score, choose first one in the list
    end
  end

  # require_relative 'scrabble/whatevs'
end
