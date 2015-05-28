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
			tiles = []
			number.times do
				tiles << select_tile
			end
			tiles
		end

		def select_tile
			tiles[rand(tiles_remaining + 1)]
		end
	end
end
