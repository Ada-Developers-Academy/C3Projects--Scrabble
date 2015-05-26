require './lib/scrabble'

describe 'Scoring words' do
  {
  1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2 => ["D", "G"],
  3 => ["B", "C", "M", "P"],
  4 => ["F", "H", "V", "W", "Y"],
  5 => ["K"],
  8 => ["J", "X"],
  10 => ["Q", "Z"],
  }.each do |score, letter|

    it "returns #{score} for #{letter}" do
        expect(Scrabble::Scrabble.score(letter)).to eq(score)
    end


  end
end
