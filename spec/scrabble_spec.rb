require 'colorize'
require 'spec_helper'
require './lib/scrabble'

#format documentation

describe "Converting letters to values" do
  context "Letters have values" do |variable|

    it "Returns 1 for A" do
      expect(Scrabble::Scrabble.score("A")).to eq(1)
    end

    it "Returns 3 for B" do
      expect(Scrabble::Scrabble.score("B")).to eq(3)
    end

    it "Returns 3 for C" do
      expect(Scrabble::Scrabble.score("C")).to eq(3)
    end

    it "Returns 2 for D" do
      expect(Scrabble::Scrabble.score("D")).to eq(2)
    end

    it "Returns 1 for E" do
      expect(Scrabble::Scrabble.score("E")).to eq(1)
    end

    it "Returns 4 for F" do
      expect(Scrabble::Scrabble.score("F")).to eq(4)
    end

    it "Returns 2 for G" do
      expect(Scrabble::Scrabble.score("G")).to eq(2)
    end

    it "Returns 4 for H" do
      expect(Scrabble::Scrabble.score("H")).to eq(4)
    end

    it "Returns 1 for I" do
      expect(Scrabble::Scrabble.score("I")).to eq(1)
    end

    it "Returns 8 for J" do
      expect(Scrabble::Scrabble.score("J")).to eq(8)
    end

    it "Returns 5 for K" do
      expect(Scrabble::Scrabble.score("K")).to eq(5)
    end

    it "Returns 1 for L" do
      expect(Scrabble::Scrabble.score("L")).to eq(1)
    end

    it "Returns 3 for M" do
      expect(Scrabble::Scrabble.score("M")).to eq(3)
    end

    it "Returns 1 for N" do
      expect(Scrabble::Scrabble.score("N")).to eq(1)
    end

    it "Returns 1 for O" do
      expect(Scrabble::Scrabble.score("O")).to eq(1)
    end

    it "Returns 3 for P" do
      expect(Scrabble::Scrabble.score("P")).to eq(3)
    end

    it "Returns 10 for Q" do
      expect(Scrabble::Scrabble.score("Q")).to eq(10)
    end

    it "Returns 1 for R" do
      expect(Scrabble::Scrabble.score("R")).to eq(1)
    end

    it "Returns 1 for S" do
      expect(Scrabble::Scrabble.score("S")).to eq(1)
    end

    it "Returns 1 for T" do
      expect(Scrabble::Scrabble.score("T")).to eq(1)
    end

    it "Returns 1 for U" do
      expect(Scrabble::Scrabble.score("U")).to eq(1)
    end

    it "Returns 4 for V" do
      expect(Scrabble::Scrabble.score("V")).to eq(4)
    end

    it "Returns 4 for W" do
      expect(Scrabble::Scrabble.score("W")).to eq(4)
    end

    it "Returns 8 for X" do
      expect(Scrabble::Scrabble.score("X")).to eq(8)
    end

    it "Returns 4 for Y" do
      expect(Scrabble::Scrabble.score("Y")).to eq(4)
    end

    it "Returns 10 for Z" do
      expect(Scrabble::Scrabble.score("Z")).to eq(10)
    end

  end
end

  describe "Returning Values for Words" do
    context "Words have values" do |word|
      it "Returns a score of 25 for the word Pizza" do
        expect(Scrabble::Scrabble.score("Pizza")).to eq(25)
      end
    end

describe "Testing Values for Words" do
  context "Words have values" do |word|
    it "Returns highest scoring word from array" do
      expect(Scrabble::Scrabble.highest_score_from(["ten", "kite", "hat"])).to eq("kite")
    end
  end

  describe "Testing first given 7 letter word is picked"  do
    it 'chooses the first 7 letter word when a tie is present' do
      expect(Scrabble::Scrabble.highest_score_from(["aaaaaaa", "eeeeeee", "hat"])).to eq("aaaaaaa")
    end
  end

  describe "Testing output of 7 letter word chosen when tied for points with shorter length word"  do
    it 'chooses the 7 letter word when a tie is present in points even with fewer tiles' do
      expect(Scrabble::Scrabble.highest_score_from(["aaaaaaa", "fad"])).to eq("aaaaaaa")
    end
  end

  describe "Testing output of 7 letter word chosen when tied for points with shorter length word"  do
    it 'chooses the 7 letter word when a tie is present in points even with fewer tiles regardless of order' do
      expect(Scrabble::Scrabble.highest_score_from(["fad", "aaaaaaa"])).to eq("aaaaaaa")
    end
  end

  describe "Testing output of points is equal in uppercase or lowercase or mixedcase"  do
     it 'Outputs the points value in word piza in all lowercase' do
       expect(Scrabble::Scrabble.score("pizza")).to eq(25)
     end
   end

   describe "Testing output of points is equal in uppercase or lowercase or mixedcase"  do
      it 'Outputs the points value in word piza in all uppercase' do
        expect(Scrabble::Scrabble.score("PIZZA")).to eq(25)
      end
    end

    describe "Testing output of points is equal in uppercase or lowercase or mixedcase"  do
       it 'Outputs the points value in word piza in all mixedcase' do
         expect(Scrabble::Scrabble.score("PiZzA")).to eq(25)
       end
     end
   end
end
