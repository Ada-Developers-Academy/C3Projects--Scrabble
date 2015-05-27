module Scrabble
  class TileBag
    attr_reader :tiles

    ## -------------------------------------------------------------------------
    # CLASS METHODS

    def initialize
      create_tiles
      shuffle_tiles # yes, I do call this inside create_tiles
                    # but who shuffles a deck just once?
    end

    ## -------------------------------------------------------------------------
    # INSTANCE METHODS

    def draw_tiles(number) #!Q checking for valid numbers?
      shuffle_tiles

      # unless (number.to_s >= "0") && (number.to_s <= "9")
      #   return "THAT IS NOT A VALID NUMBER"
      # end

      if (number > 0) && (number <= 7)
        tiles = @tiles.pop(number)
        return tiles
      else
        return false
      end
    end

    def tiles_remaining
      return @tiles.length
    end

    ## -------------------------------------------------------------------------
    # PRIVATE METHODS
    def create_tiles
      tiles = []

      letter_counts = [
        ["a", 9], ["b", 2], ["c", 2], ["d", 4], ["e", 12], ["f", 2], ["g", 3],
        ["h", 2], ["i", 9], ["j", 1], ["k", 1], ["l", 4],  ["m", 2], ["n", 6],
        ["o", 8], ["p", 2], ["q", 1], ["r", 6], ["s", 4],  ["t", 6], ["u", 4],
        ["v", 2], ["w", 2], ["x", 1], ["y", 2], ["z", 1]
      ]

      letter_counts.each do |letter_count|
        letter = letter_count[0]
        count = letter_count[1]

        count.times do
          tiles.push(letter)
        end
      end

      @tiles = tiles

      shuffle_tiles
    end

    def shuffle_tiles
      temp_storage = @tiles.dup
      new_tiles = []

      count = tiles_remaining

      count.times do
        which_random_index = rand(0...temp_storage.length)
        new_tiles.push(temp_storage.slice!(which_random_index, 1))
      end

      @tiles = new_tiles.flatten

      return true
    end
  end
end
