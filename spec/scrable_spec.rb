require 'spec_helper'
require './lib/scrabble'

describe "class methods" do
   it "returns an error if the user type a number" do
     expect(Scrabble::Scrabble.score(76)).to eq("Error!")
   end

   it "returns an error if the user type a 0" do
     expect(Scrabble::Scrabble.score(0)).to eq("Error!")
   end

  it "returns an error if the user type a space in the word" do
    expect(Scrabble::Scrabble.score("wo rd")).to eq("Error!")
  end

  it "returns an error if the word contains more than 7 letters" do
    expect(Scrabble::Scrabble.score("Helloworld")).to eq("Error!")
  end

  it " returns the total score value for the given word" do
    expect(Scrabble::Scrabble.score("wwqk")).to eq 23
  end

end
