require 'spec_helper'
require './lib/scrabble'

describe "class method self.score()" do

  it "returns an error if argument is empty string" do
    expect(Scrabble::Scrabble.score("")).to eq("Error!")
  end

  it "returns an error if argument is number" do
    expect(Scrabble::Scrabble.score(76)).to eq("Error!")
  end

  it "returns an error if argument is 0" do
    expect(Scrabble::Scrabble.score(0)).to eq("Error!")
  end

  it "returns an error if argument has spaces" do
    expect(Scrabble::Scrabble.score("wo r d")).to eq("Error!")
  end

  it "returns an error if argument length is more than 7 letters" do
    expect(Scrabble::Scrabble.score("Helloworld")).to eq("Error!")
  end

  it "returns the total score value for the given word" do
    expect(Scrabble::Scrabble.score("wwqk")).to eq 23
  end

  it "check that argument case insensitive" do
    expect(Scrabble::Scrabble.score("hEllO")).to eq 8
  end
end


describe "class method self.highest_score_from(array_of_words)" do
  it "returns error message if no words provided" do
    expect(Scrabble::Scrabble.highest_score_from([])).to eq("Error, provide words, please")
  end

  it "returns the word with the highest score" do
    expect(Scrabble::Scrabble.highest_score_from(["aa", "qz", "kx", "qqq"])).to eq("qqq")
  end

  describe "case when top score is tied between multiple words" do
    it "returns the one with the fewest letters" do
      expect(Scrabble::Scrabble.highest_score_from(["jx", "qka", "qbda", "kkki"])).to eq("jx")
    end

    it "returns the one with seven letters over the one with fewer tiles." do
      expect(Scrabble::Scrabble.highest_score_from(["quarter", "jx", "qka"])).to eq("quarter")
    end

    it "returns the first one, if the words have the same length" do
      expect(Scrabble::Scrabble.highest_score_from(["kaaaakd", "quarter", "faaaayy"])).to eq("kaaaakd")
    end
  end
end
