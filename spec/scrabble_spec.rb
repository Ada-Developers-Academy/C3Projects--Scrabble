require './lib/scrabble'

describe "Letters & Scores" do

[
  ["A", 1],
  ["E", 1],
  ["I", 1],
  ["O", 1],
  ["U", 1],
  ["L", 1],
  ["N", 1],
  ["R", 1],
  ["S", 1],
  ["T", 1],
  ["D", 2],
  ["G", 2],
  ["B", 3],
  ["C", 3],
  ["M", 3],
  ["P", 3],
  ["F", 4],
  ["H", 4],
  ["V", 4],
  ["W", 4],
  ["Y", 4],
  ["K", 5],
  ["J", 8],
  ["X", 8],
  ["Q", 10],
  ["Z", 10]

]#.each do |letter, letter_score|
  it "splitting the words into an array of letters" do
    expect(Scrabble::Scrabble.letters_in_word("DOG")).to eq(["D","O","G"])
  end

  it "gets the score for each letter in word" do
    expect(Scrabble::Scrabble.convert_letter_score("dog")).to eq(5)
  end

end


# it "returns #{letter_score} for #{word}" do
#   expect(self.score(word)).to eq letter_score #except calling score when call A equal to 1
# end
