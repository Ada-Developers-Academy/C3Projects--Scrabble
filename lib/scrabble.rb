module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  # constant scoring for scrabble
 LETTERS = {
   1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
   2=> ["D", "G"],
   3=> ["B", "C", "M", "P"],
   4=> ["F", "H", "V", "W", "Y"],
   5=> "K",
   8=> ["J", "X"],
   10=> ["Q", "Z"]
 }

  class Scrabble

    def chop(word)
      input_letters = word.split(//)
    end

    #   def self.score(word)
    #     chop
    #   # LETTERS.find do |point, letters|
    #   #   if
    #   # end
    # end
  end

end

# Scrabble::Scrabble.new
