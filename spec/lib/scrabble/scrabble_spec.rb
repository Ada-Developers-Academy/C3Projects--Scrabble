# require "pathname"
#
# PROJECT_ROOT = Pathname(__dir__).parent.parent
#
# require PROJECT_ROOT.join('lib/scrabble')

require "./lib/scrabble/scrabble"

describe "SCRABBLE calculates word scores." do

  # letters -- score them

  context "scoring letters on their own:" do
    it "returns 3 points for letter p." do
      expect(Scrabble::Scrabble.score_letter("p")).to eq(3)
    end
  end


  # breaking words into letters -- for scoring

  context "scoring valid words made of letters:" do
    it "returns 9 for apple (lowercase!)." do
      expect(Scrabble::Scrabble.score("apple")).to eq(9)
    end

    it "returns 8 for POTATO (uppercase!)." do
      expect(Scrabble::Scrabble.score("POTATO")).to eq(8)
    end

    it "returns 16 for qUaRtER (weird caps!)." do
      expect(Scrabble::Scrabble.score("qUaRtER")).to eq(16)
    end
  end


  # breaking words into letters -- when this can't happen

  context "yell at user for providing inappropriate content:" do
    it "returns WORDS SHOULD NOT BE NOTHING! for nil values." do
      expect(Scrabble::Scrabble.score(nil)).to eq("WORDS SHOULD NOT BE NOTHING!")
    end

    it "returns INVALID WORD for long words & empty strings." do
      expect(Scrabble::Scrabble.score("quaternary")).to eq("INVALID WORD!")
      expect(Scrabble::Scrabble.score("elephant")).to eq("INVALID WORD!")
      expect(Scrabble::Scrabble.score("")).to eq("INVALID WORD!")
    end

    it "returns THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD! for input that is outside a-z range." do
      # spaces
      expect(Scrabble::Scrabble.score("hot dog")).to eq("THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD!")
      # numbers at end
      expect(Scrabble::Scrabble.score("dogs123")).to eq("THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD!")
      # numbers at beginning
      expect(Scrabble::Scrabble.score("123dogs")).to eq("THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD!")
      # seriously legit numbers
      expect(Scrabble::Scrabble.score(123)).to eq("THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD!")
    end
  end
end


describe "SCRABBLE can find the best word score from a list of words." do
  context "error handling:" do
    it "shouts about invalid words if there are no valid words in a set." do
      expect(Scrabble::Scrabble.highest_score_from(["elephant", "quaternary", "", "123dogs", "hot dog", 43543, nil, "//..,,n"])).to eq("NONE OF YOUR WORDS WERE REAL WORDS!")
    end

    it "ignores invalid words in test word array and returns quarter as best word." do
      expect(Scrabble::Scrabble.highest_score_from(["potato", "elephant", "apple", "quarter", "123dogs", "hot dog", "hotdog"])).to eq("quarter")
    end
  end

  context "100% valid lists" do
    it "picks the shortest word for a score when multiple words have the same value (returns play instead of apple)." do
      expect(Scrabble::Scrabble.highest_score_from(["apple", "play"])).to eq("play") # "pleaser"
    end

    it "picks the seven-letter word for a score when multiple words have the same value (returns pleaser instead of play)." do
      expect(Scrabble::Scrabble.highest_score_from(["apple", "play", "pleaser"])).to eq("pleaser") # "pleaser"
    end

    it "picks the first word for a score when multiple words have the same value." do
      expect(Scrabble::Scrabble.highest_score_from(["apple", "paple"])).to eq("apple")
    end
  end
end
