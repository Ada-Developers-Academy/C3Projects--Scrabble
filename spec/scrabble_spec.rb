require "./lib/scrabble"
require "spec_helper"

describe "Letters & Scores" do
  # [
  #   ["A", 1],
  #   ["E", 1],
  #   ["I", 1],
  #   ["O", 1],
  #   ["U", 1],
  #   ["L", 1],
  #   ["N", 1],
  #   ["R", 1],
  #   ["S", 1],
  #   ["T", 1],
  #   ["D", 2],
  #   ["G", 2],
  #   ["B", 3],
  #   ["C", 3],
  #   ["M", 3],
  #   ["P", 3],
  #   ["F", 4],
  #   ["H", 4],
  #   ["V", 4],
  #   ["W", 4],
  #   ["Y", 4],
  #   ["K", 5],
  #   ["J", 8],
  #   ["X", 8],
  #   ["Q", 10],
  #   ["Z", 10]
  # ]#.each do |letter, letter_score|

  it "responds with the scores for the letters" do
    ("A".."Z").each do |letter|
      score_value = Scrabble::Scrabble.score(letter)
      lookup_value = Scrabble::SCOREBOARD[letter]

      expect(score_value).to eq(lookup_value)
    end
  end

  it "splits the words into an array of letters" do
    expect(Scrabble::Scrabble.letters_in_word("DOG")).to eq(["D","O","G"])
  end

  it "gets the score for each letter in word" do
    expect(Scrabble::Scrabble.score("dog")).to eq(5)
  end

  it "gets the highest score from array of words" do
    expect(Scrabble::Scrabble.highest_score_from(["dog", "apple"])).to eq("apple")
  end

  it "gets the shorter word in a tie" do
    expect(Scrabble::Scrabble.highest_score_from(["kk", "z"])).to eq("z")
  end

  it "breaks a tie with the winner having 7 tiles over fewer" do
     expect(Scrabble::Scrabble.highest_score_from(["z", "aaaaddd"])).to eq("aaaaddd")
  end

  it "first word wins if there for same high-score words w/ same length" do
    expect(Scrabble::Scrabble.highest_score_from(["xx", "jj"])).to eq("xx")
  end

  it "picks the first word when length and score are the same, even when they're 7 letter words" do
    expect(Scrabble::Scrabble.highest_score_from(["letters", "lettere", "lllllll"])).to eq("letters")
  end

  it "it puts an error when a word contains invalid characters" do
    expect(Scrabble::Scrabble.score("")).to eq("Must pick a letter!")
  end

  it "it puts an error when a word contains numbers" do
    expect(Scrabble::Scrabble.score("1")).to eq("Must pick a letter!")
  end

  it "it doesn't give a score if array_of_words is empty" do
    expect(Scrabble::Scrabble.highest_score_from([])).to eq([])
  end

end
