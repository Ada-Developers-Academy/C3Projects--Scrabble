describe Scrabble::Scrabble do

  describe '.score(word)' do
    it "responds to .score" do
      expect(Scrabble::Scrabble).to respond_to :score
    end

    it "returns 9 for `.score('play')`" do
      expect(Scrabble::Scrabble.score('play')).to eq(9)
    end

    it "treats both uppercase and lowercase the same" do
      expect(Scrabble::Scrabble.score('PLAY')).to eq(Scrabble::Scrabble.score('PLAY'))
    end

  end

  describe '.highest_score_from(array_of_words)' do
    #michael = 14
    #jesters = 14
    #zy = 14
    #zoog = 14
    #zoo = 12
    #yellow = 12
    #jest = 11
    #home = 9
    #j = 8
    #first = 8
    #seven = 8
    #doll = 5
    #all = 3

    #michael = 14
    #jesters = 14
    #zy = 14
    #zoog = 14
    #zoo = 12
    #yellow = 12
    #jest = 11

    it "responds to .highest_score_from(array_of_words)" do
      expect(Scrabble::Scrabble).to respond_to :highest_score_from
    end

    it "returns the word with the highest score" do
      expect(Scrabble::Scrabble.highest_score_from(['zz', 'aa', 'cat', 'dog'].shuffle)).to eq('zz')
    end

    it "when words tie, selects the word with 7 characters" do
      expect(Scrabble::Scrabble.highest_score_from(['michael', 'zy', 'zoog', 'zoo', 'yellow', 'jest'].shuffle)).to eq('michael')
    end

    it "when two 7-tile words tie, select word shown first in the array" do
      expect(Scrabble::Scrabble.highest_score_from(['michael', 'jesters', 'zy', 'zoog', 'zoo', 'yellow', 'jest'])).to eq('michael')
    end

    it "when words tie, selects the word with fewer characters" do
      expect(Scrabble::Scrabble.highest_score_from(['zy', 'zoog', 'jest', 'home', 'first', 'seven', 'doll', 'all'].shuffle)).to eq('zy')
    end

    it "when two <7-tile words tie and are same length, select word shown first in the array" do
      expect(Scrabble::Scrabble.highest_score_from(['all', 'first', 'doll', 'seven'])).to eq('first')
    end

  end

end
