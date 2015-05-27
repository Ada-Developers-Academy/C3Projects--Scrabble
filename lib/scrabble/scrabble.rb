module Scrabble
  class Scrabble
    ## -------------------------------------------------------------------------
    # CONSTANTS
    LETTER_SCORES = [
      { points: 1,  letters: %w{a e i o u l n r s t} },
      { points: 2,  letters: %w{d g} },
      { points: 3,  letters: %w{b c m p} },
      { points: 4,  letters: %w{f h v w y} },
      { points: 5,  letters: %w{k} },
      { points: 8,  letters: %w{j x} },
      { points: 10, letters: %w{q z} }
    ]

    ## -------------------------------------------------------------------------
    # INSTANCE METHODS

    # do we need these?

    ## -------------------------------------------------------------------------
    # CLASS METHODS
    def self.highest_score_from(array_of_words)
      best_score = 0
      best_word = nil

      array_of_words.each do |current_word|
        current_score = self.score(current_word)

        # handling unqualified words, which return string output instead of fixednum
        if current_score.class == String
          next
        end

        # handling simple word comparisons
        if (current_score > best_score) # then update best record!
          best_score = current_score
          best_word = current_word

        # handling more complicated comparisons: keep old word if length the same or if length == 7, but set new word otherwise
        elsif (current_score == best_score) && (current_word.length < best_word.length) && (best_word.length != 7)
          best_score = current_score # then update best record!
          best_word = current_word

        # handling last complicated case: if new word has seven letters, it trumps the shorter word rule!
        elsif (current_score == best_score) && (best_word.length != 7) && (current_word.length == 7)
          best_score = current_score # then update best record!
          best_word = current_word
        end
      end

      # handling case: none of the words passed qualification tests
      if best_word == nil
        return "NONE OF YOUR WORDS WERE REAL WORDS!"
      else
        return best_word
      end
    end


    def self.score(word)
      # first: raise some noise about nil values
      if word == nil
        return "WORDS SHOULD NOT BE NOTHING!"
      end

      # first: format word
      word = word.to_s # handling for numbers (fixednum, floats)

      # handling anything too long or short to be a legal word
      if (word.length > 7) || (word.length == 0)
        return "INVALID WORD!"
      end

      # if a word gets this far, it should be a word!
      word.downcase! # so get rid of any ridiculous uppercase letters.

      word_score = 0 # let's start counting from nothing!

      word.each_char do |char|
        if (char >= "a") && (char <= "z")
          word_score += score_letter(char) # and then add to it as letters appear.
        # handling for letters outside legal a-z range.
        else
          return "THERE IS SOME ILLEGAL CHARACTER IN YOUR WORD!"
        end
      end

      return word_score # since we're out of letters, you can have your score back.
    end


    private
    ## -------------------------------------------------------------------------
    # PRIVATE METHODS

    def self.score_letter(letter) # can class methods be private?
      LETTER_SCORES.each do |set|
        if set[:letters].include? letter
          return set[:points]
        end
      end
    end
  end
end
