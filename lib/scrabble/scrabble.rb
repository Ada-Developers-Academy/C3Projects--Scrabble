CONVERSIONS = [
  [1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]],
  [2, ["D", "G"]],
  [3, ["B", "C", "M", "P"]],
  [4, ["F", "H", "V", "W", "Y"]],
  [5, ["K"]],
  [8, ["J", "X"]],
  [10, ["Q", "Z"]]
]

module Scrabble

  class Scrabble

    def get_conversion_for(letter)
      CONVERSIONS.find do |point, letter_array|
        if letter_array.include?(letter)
          return point
        end
      end
    end


  end
end
