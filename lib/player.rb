module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      @name = name
    end

    # self.new(name): creates a new instance with the instance variable name assigned
    # #name: returns the @name instance variable
    # #plays: returns an Array of the words played by the player
    # #play(word): Adds the input word to the plays Array
      # Returns false if player has already won
    # #total_score: Sums up and returns the score of the players words
    # #won?: If the player has over 100 points, returns true, otherwise returns 'false'
    # #highest_scoring_word: Returns the highest scoring word the user has played.
    # #highest_word_score: Returns the highest_scoring_word score.

  end
end
