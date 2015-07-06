# Create a Board class that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction.
# Include a minimum of 20 specs between the Dictionary and Board classes.

##------------
# DEPENDENCIES
require_relative "../../../lib/scrabble/board"

describe "a BOARD is a place to play words (that are legal & made of tiles)!" do
  before :each do
    @boardy = Scrabble::Board.new
  end


  context "the board exists!" do
    it "has 225 possible spots for letters to be placed in" do
      spots = 0

      @boardy.board.each do |row|
        spots += row.length
      end

      expect(spots).to eq(225)
    end
  end


  context "words can be played on the board!" do
    before :each do
      @word = { word: "apple", location: { row: 3, column: 4 } }
    end

    it "can be played horizontally / over" do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ a p p l e _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #7  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      expect(@boardy.play(@word[:word], @word[:location], "over")).to eq(true)
    end

    it "can be played vertically / down" do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ a _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ p _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ p _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ l _ _ _ _ _ _ _ _ _ _
      #7  _ _ _ _ e _ _ _ _ _ _ _ _ _ _
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      expect(@boardy.play(@word[:word], @word[:location], "down")).to eq(true)
    end

    it "cannot be played past the end of the board" do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #7  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ A P P L E <-- totally off the board.
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ P
      #                               P <-- nope.
      #                               L <-- no.
      #                               E <-- stop it.
      expect(@boardy.play(@word[:word], { row: 13, column: 14 }, "over")).to eq(false)
      expect(@boardy.play(@word[:word], { row: 13, column: 14 }, "down")).to eq(false)
    end
  end


  context "words can be played next to other words" do
    before :each do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ _ _ _ b a n a n a _ _
      #7  _ _ _ a p p l e _ _ _ _ _ _ _
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      @boardy.play("banana", { row: 6, column: 7 }, "over")
      @boardy.play("apple", { row: 7, column: 3 }, "over")
    end

    it "does not overwrite previous words placed on the board" do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ _ _ _ b a n S P E A R <--- illegal play!
      #7  _ _ _ a p p l e _ _ _ _ _ _ _
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      expect(@boardy.play("spear", { row: 6, column: 10 }, "down")).to eq(false)
      expect(@boardy.board[6][10]).to eq("a")
    end

    it "cannot be played over other words" do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ O _ _ _ _ _ _ _ <-- poss. legal placement of o
      #6  _ _ _ _ _ _ _ R a n a n a _ _ <-- illegal overwrt. of b w/ r
      #7  _ _ _ a p p l A _ _ _ _ _ _ _ <-- illegal overwrt. of e w/ a
      #8  _ _ _ _ _ _ _ N _ _ _ _ _ _ _ <-- poss. legal placement of n
      #9  _ _ _ _ _ _ _ G _ _ _ _ _ _ _ <-- poss. legal placement of g
      #10 _ _ _ _ _ _ _ E _ _ _ _ _ _ _ <-- poss. legal placement of e
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      expect(@boardy.play("orange", { row: 5, column: 7 }, "down")).to eq(false)
    end

    it "cannot be played next to another word unless all adjacencies are legal words" do
      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ _ _ _ b a n a n a _ _
      #7  _ _ _ a p p l e _ _ S P E A R <-- 'as' might be a legal word, but 'np'
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _     and 'ae' definitely aren't!
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      expect(@boardy.play("spear", { row: 7, column: 10 }, "over")).to eq(false)
      expect(@boardy.board[7][10]).to eq("")
      expect(@boardy.board[7][11]).to eq("")

      #                       1 1 1 1 1
      #   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4
      #0  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #1  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #2  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #3  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #4  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #5  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #6  _ _ _ _ _ _ _ b a n a n a S _ <-- bananas is a word.
      #7  _ _ _ a p p l e _ _ _ _ _ P _ <-- awesome.
      #8  _ _ _ _ _ _ _ _ _ _ _ _ _ E _ <-- super cool.
      #9  _ _ _ _ _ _ _ _ _ _ _ _ _ A _ <-- yeah!
      #10 _ _ _ _ _ _ _ _ _ _ _ _ _ R _ <-- great, this whole thing looks legal!
      #11 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #12 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #13 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      #14 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      expect(@boardy.play("spear", { row: 6, column: 13 }, "down")).to eq(true)
      expect(@boardy.board[6][13]).to eq("s")
      expect(@boardy.board[7][13]).to eq("p")
    end
  end
end
