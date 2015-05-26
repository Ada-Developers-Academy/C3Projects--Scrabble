require './lib/scrabble/scrabble'

describe Scrabble::Scrabble.score do
  it "returns the total score for a word" do
    expect(Scrabble::Scrabble.score("play")).to eq(9)
    expect(Scrabble::Scrabble.score("awesome")).to eq(12)
  end

  it "despite case (i.e. is case insensitive)" do
    expect(Scrabble::Scrabble.score("LeBlanc")).to eq(11)
  end

  it "unless user inputs non-alpha characters" do
    expect(Scrabble::Scrabble.score("4ever")).to eq(nil)
    expect(Scrabble::Scrabble.score("sav0r")).to eq(nil)
    expect(Scrabble::Scrabble.score("f$%!")).to eq(nil)
  end

  it "unless user doesn't input anything" do
    expect(Scrabble::Scrabble.score("")).to eq(nil)
  end
end

describe Scrabble::Scrabble.highest_score_from do
  it "picks word with highest score" do

  end

  it "resolves a tie by picking the smaller word" do

  end

  it "resolves a tie with a seven letter word" do

  end

  it "resolves a tie with even length and score words" do

  end
end
