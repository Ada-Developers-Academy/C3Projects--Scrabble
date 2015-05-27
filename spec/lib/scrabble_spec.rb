require './lib/scrabble/scrabble.rb'

describe Scrabble::Scrabble do
  subject {Scrabble::Scrabble.new}

 context "converting letters to number scores" do
    CONVERSIONS.each do |point, letter_array|
      letter_array.each do |letter|
      if letter_array.include?(letter)
        it "returns #{point} for #{letter}" do
        expect(subject.get_conversion_for(letter)).to eq(point)
        end
      end
    end
  end
end
  
end
