require './lib/scrabble/scrabble.rb'

describe Scrabble::Scrabble do

  describe "converting letters to number scores" do
    [
      [1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]],
      [2, ["D", "G"]],
      [3, ["B", "C", "M", "P"]],
      [4, ["F", "H", "V", "W", "Y"]],
      [5, ["K"]],
      [8, ["J", "X"]],
      [10, ["Q", "Z"]]
    ].each do |point, letter_array|
      letter_array.each do |letter|
      if letter_array.include?(letter)
        it "returns #{point} for #{letter}" do
          expect(get_conversion_for(letter)).to eq(point)
        end
      end
    end
    end

  end


end
