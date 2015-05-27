# Create a Player class with a minimum of 11 specs. The class should have the following class and instance methods:
#
# self.new(name): creates a new instance with the instance variable name assigned DONE
# #name: returns the @name instance variable DONE
# #plays: returns an Array of the words played by the player INITIALIZED
# #play(word): Adds the input word to the plays Array DONE
# Returns false if player has already won DONE
# #total_score: Sums up and returns the score of the players words DONE
# #won?: If the player has over 100 points, returns true, otherwise returns 'false' DONE
# #highest_scoring_word: Returns the highest scoring word the user has played. DONE
# #highest_word_score: Returns the highest_scoring_word score. DONE

module Scrabble
  class Player
    attr_reader :name, :plays, :records

    ## -------------------------------------------------------------------------
    # INSTANCE METHODS

    def initialize(name)
      @name = name
      @plays = []
    end


    def play(word)
      unless won?
      # do this stuff inside _unless the player has already won_

        score = Scrabble.score(word)

        if (score.class == Fixnum)
          @plays.push(word)
          # puts "Great! Your word, #{ word }, was worth #{ score } points."
          # puts "That brings your score up to #{ total_score }!"
        else
          # puts score
        end

        return true

      else
      # otherwise (if the player has won), return false.
        return false
      end
    end


    def total_score
      score = 0

      @plays.each do |play|
        score += Scrabble.score(play)
      end

      return score
    end


    def highest_scoring_word
      best_word = find_word_record[:best_word]

      return best_word
    end


    def highest_word_score
      best_score = find_word_record[:best_score]

      return best_score
    end


    def won?
      if total_score > 100
        # puts "You win, #{ @name }! That was a great game."
        return true
      else
        return false
      end
    end

    # private
    ## -------------------------------------------------------------------------
    # PRIVATE METHODS

    def find_word_record
      best_word = nil
      best_score = 0

      @plays.each do |current_word|
        current_score = Scrabble.score(current_word)

        if current_score > best_score
          best_word = current_word
          best_score = current_score
        end
      end

      return { best_word: best_word, best_score: best_score }
    end
  end
end
