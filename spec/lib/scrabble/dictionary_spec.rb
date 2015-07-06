# Create a Dictionary class that includes a method for searching a list of words to determine if a given word is a valid word.
# Include a minimum of 20 specs between the Dictionary and Board classes.

##------------
# DEPENDENCIES
require_relative "../../../lib/scrabble/dictionary"
# require_relative "../../../support/dictionary.csv" # !Q why doesn't this work. b/c not ruby file?

describe "a DICTIONARY is a collection of legal words!" do
  before :each do
    @dict = Scrabble::Dictionary.new
  end

  context "the dictionary is a csv" do
    it "has different words for each letter category" do
      expect(@dict.dictionary[:n].length).to eq(25)
      expect(@dict.dictionary[:s].length).to eq(25)
      expect(@dict.dictionary[:t].length).to eq(25)

      n_vs_s = (@dict.dictionary[:n] == @dict.dictionary[:s])
      s_vs_t = (@dict.dictionary[:s] == @dict.dictionary[:t])
      t_vs_n = (@dict.dictionary[:t] == @dict.dictionary[:n])

      expect(n_vs_s).to eq(false)
      expect(s_vs_t).to eq(false)
      expect(t_vs_n).to eq(false)
    end
  end
end
