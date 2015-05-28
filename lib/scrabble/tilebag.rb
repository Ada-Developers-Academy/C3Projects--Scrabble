module Scrabble

	class TileBag
		attr_reader :tiles

		def initialize
			@tiles = [
				"a", "a", "a", "a", "a", "a", "a", "a", "a",
				"b", "b",
				"c", "c",
				"d", "d", "d", "d",
				"e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e",
				"f", "f",
				"g", "g", "g",
				"h", "h",
				"i", "i", "i", "i", "i", "i", "i", "i", "i",
				"j",
				"k",
				"l", "l", "l", "l",
				"m", "m",
				"n", "n", "n", "n", "n", "n",
				"o", "o", "o", "o", "o", "o", "o", "o",
				"p", "p",
				"q",
				"r", "r", "r", "r", "r", "r",
				"s", "s", "s", "s",
				"t", "t", "t", "t", "t", "t",
				"u", "u", "u", "u",
				"v", "v",
				"w", "w",
				"x",
				"y", "y",
				"z"
			]
		end

		def tiles_remaining
			tiles.count
		end

		def draw_tiles(number)
			return "ERROR -- not enough tiles" if tiles.length < number
			drawn_tiles = []
			number.times do
				tile, index = select_tile
				drawn_tiles << tile
				tiles.delete_at(index)
			end
			drawn_tiles
		end

		def select_tile
			index = rand(tiles_remaining - 1)
			return tiles[index], index
		end
	end
end
