require './lib/scrabble/scrabble'

describe "score method" do
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

describe "highest_score_from" do
  it "picks word with highest score" do
    expect(Scrabble::Scrabble.highest_score_from(["hey", "cat", "deliver"])).to eq("deliver")
  end

  it "resolves a tie by picking the smaller word" do
    expect(Scrabble::Scrabble.highest_score_from(["hate", "kid", "lame"])).to eq("kid")
  end

  it "resolves a tie with a seven letter word" do
    # even if the other word is smaller
    expect(Scrabble::Scrabble.highest_score_from(["deliver", "zit", "awesome"])).to eq("awesome")
  end

  it "resolves a tie with even length and score words" do
    expect(Scrabble::Scrabble.highest_score_from(["out", "date", "gate"])).to eq("date")
  end
end
