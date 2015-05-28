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
    expect(Scrabble::Scrabble.score("dog")).to eq(5)
  end

  it "gets the highest score from array of words" do
    expect(Scrabble::Scrabble.highest_score_from(["dog", "apple"])).to eq("apple")
  end

  it "checks to see if input is a valid character"
    expect(Scrabble::Scrabble.score("2")).to eq("Enter a valid word")
  end

  it "breaks a tie with the winner using fewer tiles" do
    expect(Scrabble::Scrabble.highest_score_from(["kk", "z"])).to eq("z")
  end

  it "breaks a tie with the winner having 7 tiles over fewer" do
    expect(Scrabble::Scrabble.highest_score_from(["z", "aaaaddd"])).to eq("aaaaddd")
  end

end
