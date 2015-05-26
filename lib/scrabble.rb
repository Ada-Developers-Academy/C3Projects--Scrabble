module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  class Scrabble

    ONE_POINT = {"A", "E", "I", "O", "U", "L", "N", "R", "S", "T" => 1}
    ONE_POINT = {1 => ["A", "B", "C"]}
    %w(A B C D)
    TWO_POINTS = {"D", "G"}
    THREE_POINTS = {"B", "C", "M", "P"}
    FOUR_POINTS = {"F", "H", "V", "W", "Y"}
    FIVE_POINTS = {"K"}
    EIGHT_POINTS = {"J", "X"}
    TEN_POINTS = {"Q", "Z"}

    def self.score(word)
      # returns the total score value for the given word.
      # The word is input as a string (case insensitive).
      # The chart below shows the point value for a given letter.
      return ONE_POINT.
    end

    def self.highest_score_from(array_of_words)
      # returns the word in the array with the highest score.
    end

    # Note that it’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters.
    # Note that there is a greater bonus for using all seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
    # If the there are multiple words that are the same score and same length, pick the first one in supplied list
  end
end


# self.score(word)
#
# self.highest_score_from(array)
#   return the word with the highest score--not the numeric value of the score (you get the word itself)
#   better to use better tiles: three letter word scores better than four letter words (prefer fewer tiles) BUT
#     if you use seven letters that's better than 1..6
#     if same socre & same length, pick the first one in the list
#
#     cases
#       -empty array / nil
#       -any array items like in the below edge cases (array items matching sort cases)
#       -must input Array (no hash or int/String/etc)
#
#
# "play"
# p = 3
# l = 1
# a = 1
# y = 4
#
# self.score("play")
# => 9
# Edge Cases
#   Test
#   -User provides
#     #s
#     special characs
#     spaces
#     nothing -> "", nil
#     case senstivitiy
#     more than 7 letters
#
# -max of 7 letters for each word
