require './lib/scrabble'

describe 'Scrabble::Scrabble.score' do

  context 'Method operations' do

    it "Splits the word into an array of letters" do
      expect(Scrabble::Scrabble.split_word("PLAY")).to eq(["P","L","A","Y"])
    end

    it "Converts the letters into scores" do
    expect(Scrabble::Scrabble.convert_scores("PLAY")).to eq(9)
    end

    it "Returns the total score for the word" do
    expect(Scrabble::Scrabble.score("ax")).to eq(9)
    end

  end

  context "Checking word edge cases" do

    it "Returns error with numerical entries" do
    expect(Scrabble::Scrabble.score("4")).to eq("Not a word!")
    end

    it "Returns error with weird character entries" do
    expect(Scrabble::Scrabble.split_word("pl@y")).to eq("That's not a word!")
    end

    it "Returns error with nil entry" do
    expect(Scrabble::Scrabble.score(nil)).to eq("Yeah, silence is golden. But I still need a word")
    expect(Scrabble::Scrabble.score("")).to eq("Yeah, silence is golden. But I still need a word")
    end

  end
end



describe 'Scrabble::Scrabble.highest_score_from' do

  context "Method operations" do

    it "Matches scores with their corresponding array words" do
      expect(Scrabble::Scrabble.match_scores_and_words(["ax", "play", "blah", "quackier"])).to eq(["9 : ax", "9 : play", "9 : blah", "23 : quackier"])
    end

    it "Displays the winning word" do
      expect(Scrabble::Scrabble.highest_score_from(["ax", "play", "blah", "quackier"])).to eq("quackier")
    end
  end
end


  #   # Tests the SCORE_TABLE
  #   {
  #   "A" => 1,
  #   "E" => 1,
  #   "I" => 1,
  #   "O" => 1,
  #   "U" => 1,
  #   "L" => 1,
  #   "N" => 1,
  #   "R" => 1,
  #   "D" => 2,
  #   "G" => 2,
  #   "B" => 3,
  #   "C" => 3,
  #   "M" => 3,
  #   "P" => 3,
  #   "F" => 4,
  #   "H" => 4,
  #   "V" => 4,
  #   "W" => 4,
  #   "Y" => 4,
  #   "K" => 5,
  #   "J" => 8,
  #   "X" => 8,
  #   "Q" => 10,
  #   "Z" => 10,
  # }.each do |letter, score|
  #
  #     it "returns #{score} for #{letter}" do
  #         expect(Scrabble::Scrabble.score(letter)).to eq(score)
  #     end
  #
  #   end
