require './lib/scrabble'

describe 'Scoring words' do

  {
  "A" => 1,
  "E" => 1,
  "I" => 1,
  "O" => 1,
  "U" => 1,
  "L" => 1,
  "N" => 1,
  "R" => 1,
  # 1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  # 2 => ["D", "G"],
  # 3 => ["B", "C", "M", "P"],
  # 4 => ["F", "H", "V", "W", "Y"],
  # 5 => ["K"],
  # 8 => ["J", "X"],
  # 10 => ["Q", "Z"],
}.each do |letter, score|

    it "returns #{score} for #{letter}" do
        expect(Scrabble::Scrabble.score(letter)).to eq(score)
    end


  end
end
