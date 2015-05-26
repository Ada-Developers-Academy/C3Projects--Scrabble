require './lib/scrabble/scrabble'

describe "Returns the total score for a word" do
  it ", for example: 'play' returns 9" do
    expect(self.score("play")).to eq(9)
  end
end
