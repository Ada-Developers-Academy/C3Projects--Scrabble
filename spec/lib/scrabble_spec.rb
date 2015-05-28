describe Scrabble::Scrabble do

  describe 'class methods are defined' do
    METHOD_LIST = [:score, :highest_score_from, :handle_ties, :seven_chars?, :handle_7_chars, :find_shortest, :find_first_in_original]
    METHOD_LIST.each do |method_name|
      it "`.#{method_name}`" do
        expect(Scrabble::Scrabble).to respond_to method_name
      end
    end
  end

  describe '.score(word)' do
    it "returns 9 for `.score('play')`" do
      expect(Scrabble::Scrabble.score('play')).to eq(9)
    end

    it "treats both uppercase and lowercase the same" do
      expect(Scrabble::Scrabble.score('PLAY')).to eq(Scrabble::Scrabble.score('play'))
    end

  end

  describe '.highest_score_from()' do
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

    it "returns the word with the highest score" do
      expect(Scrabble::Scrabble.highest_score_from(['zz', 'aa', 'cat', 'dog'].shuffle)).to eq('zz')
    end

#?? context: when words tie ??

    it "when words tie, selects the word with 7 characters" do
      expect(Scrabble::Scrabble.highest_score_from(['michael', 'zy', 'zoog', 'zoo', 'yellow', 'jest'].shuffle)).to eq('michael')
    end

    it "when two 7-tile words tie, select word shown first in the array" do
      expect(Scrabble::Scrabble.highest_score_from(['zoo', 'michael', 'yellow', 'jesters', 'jest', 'zy', 'zoog'])).to eq('michael')
    end

    it "when words tie, selects the word with fewer characters" do
      expect(Scrabble::Scrabble.highest_score_from(['zy', 'zoog', 'jest', 'home', 'first', 'seven', 'doll', 'all'].shuffle)).to eq('zy')
    end

    it "when two <7-tile words tie and are same length, select word shown first in the array" do
      expect(Scrabble::Scrabble.highest_score_from(['all', 'first', 'doll', 'seven'])).to eq('first')
    end

  end

  # describe '.seven_chars?()' do
  # end

end
