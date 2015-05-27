module Scrabble
  class Player
    attr_reader :name, :plays, :tiles

    ## -------------------------------------------------------------------------
    # CLASS METHODS

    def initialize(name)
      @bag_o_tiles = TileBag.new
      @name = name
      @plays = []
      @tiles = []

      # draw_tiles(@bag_o_tiles)
    end

    ## -------------------------------------------------------------------------
    # INSTANCE METHODS

    def play(word)
      unless won?
      # do this stuff inside _unless player has already won_.
      # then return true to indicate that the word was played. :)

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
      # otherwise (if player has won), return false, since no word was played.
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


    # Create specs for (minimum 2) and add to the Player class the following instance methods:
    # #tiles a collection of letters that the player can play (max 7)
    # #draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag

    def draw_tiles(tile_bag) #!Q do I need to check whether tile bag is a real tile bag?
      max_tiles = 7

      tiles_count = @tiles.length

      if tiles_count < max_tiles
        new_tiles = tile_bag.draw_tiles(max_tiles - tiles_count)

        new_tiles.each do |tile|
          @tiles.push(tile)
        end

        print @tiles

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
