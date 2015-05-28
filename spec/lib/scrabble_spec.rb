describe Scrabble::Scrabble do

  describe 'indirectly-tested class methods are defined' do
    METHOD_LIST = [:handle_ties, :find_first_in_original]
    METHOD_LIST.each do |method_name|
      it "responds to .#{method_name}" do
        expect(Scrabble::Scrabble).to respond_to method_name
      end
    end
  end

  describe '.score(word)' do
    it "returns 9 for 'play'" do
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

    context "when words tie" do
      it "selects the word with 7 characters" do
        expect(Scrabble::Scrabble.highest_score_from(['michael', 'zy', 'zoog', 'zoo', 'yellow', 'jest'].shuffle)).to eq('michael')
      end

      it "selects the word with fewer characters (if neither has 7 chars)" do
        expect(Scrabble::Scrabble.highest_score_from(['zy', 'zoog', 'jest', 'home', 'first', 'seven', 'doll', 'all'].shuffle)).to eq('zy')
      end
    end

    context "when words of same length tie" do
      it "select word shown first in the array (7-char words)" do
        expect(Scrabble::Scrabble.highest_score_from(['zoo', 'michael', 'yellow', 'jesters', 'jest', 'zy', 'zoog'])).to eq('michael')
      end

      it "select word shown first in the array (<7-char words)" do
        expect(Scrabble::Scrabble.highest_score_from(['all', 'first', 'doll', 'seven'])).to eq('first')
      end
    end
  end

end
