require './lib/scrabble'

describe 'Scrabble::Scrabble.score' do

  context 'Scoring individual words that pass through' do

    it "Splits the word into an array of letters" do
      expect(Scrabble::Scrabble.split_word("play")).to eq(["P","L","A","Y"])
    end

    # Mahalo to Alice for the "zamboni" 7-letter, 20-point word!
    it "Converts the letters into scores" do
      expect(Scrabble::Scrabble.convert_scores("zamboni")).to eq(20)
    end

    it "Returns the total score for the word" do
      expect(Scrabble::Scrabble.score("ax")).to eq(9)
    end

  end

  context "Checking word edge cases" do

    it "Returns error with numerical entries" do
      expect(Scrabble::Scrabble.score("4")).to eq("Numb3rs don't c0unt!")
    end

    it "Returns error with weird character entries" do
      expect(Scrabble::Scrabble.split_word("pl@y")).to eq("$top typing we!rd.")
    end

    it "Returns error with nil or empty entry" do
      expect(Scrabble::Scrabble.score(nil)).to eq("Yeah, silence is golden. But I still need a word")
      expect(Scrabble::Scrabble.score("")).to eq("Yeah, silence is golden. But I still need a word")
    end

    it "Returns error when word exceeds 7 letters" do
      expect(Scrabble::Scrabble.score("sesquipedalian")).to eq("Your word exceeds 7 letters! What are you, a sesquipedalian? (I Googled it for you: noun, a person who uses big words)")
    end

  end
end



describe 'Scrabble::Scrabble.highest_score_from' do

  context "Scoring words in an array" do

    # Mahalo to TA Kai for helping me with my weird match array idea!
    it "Matches scores with their corresponding array words" do
      expect(Scrabble::Scrabble.match_scores_and_words(["ax", "play", "quick","hafiz", "jeez"])).to eq(["9 : ax", "9 : play", "20 : quick", "20 : hafiz", "20 : jeez"])
    end

    it "Displays the winning word without ties" do
      expect(Scrabble::Scrabble.top_word(["yo", "play", "hafiz"])).to eq("hafiz")
    end
  end


  context "Checking array edge cases" do

    it "Chooses the shortest word" do
      expect(Scrabble::Scrabble.highest_score_from(["ax", "play", "quick", "hafiz", "jeez"])).to eq("jeez")
    end

    it "Chooses the first word" do
      expect(Scrabble::Scrabble.highest_score_from(["ax", "play", "quick", "hafiz"])).to eq("quick")
    end

    it "Checks for seven" do
      expect(Scrabble::Scrabble.highest_score_from(["ax", "play", "quick", "hafiz", "zamboni"])).to eq("zamboni")
    end
  end
end
