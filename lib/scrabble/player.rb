module Scrabble
  class Player
    attr_accessor :name, :played, :playing

    def initialize(name)
      @name = name
      @played = []
      @playing = true
    end

    def play(word)
      if @playing
        @played.push(word)
      else
        return false
      end
    end

    def plays
      return @played
    end
  end
end
