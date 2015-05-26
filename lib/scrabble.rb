module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'
  class Scrabble
    # def initialize
    #   @value = { a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1, t: 1, 
    #              d: 2, g: 2, 
    #              b: 3, c: 3, m: 3, p: 3,
    #              f: 4, h: 4, v: 4, w: 4, y: 4,
    #              k: 5,
    #              j: 8, x: 8,
    #              q: 10, z: 10
    #   }
    # end
    def self.score(word)
      value = { 
                 1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
                 2 => ["d", "g"], 
                 3 => ["b", "c", "m", "p"],
                 4 => ["f", "h", "v", "w", "y"],
                 5 => ["k"],
                 8 => ["j", "x"],
                 10 => ["q", "z"]
                }

        count = 0
        word.each_char do |l|
          #check if each char is a letter
          value.select do |k, v|
            if v.include?(l)
              count += k
            end
          end
        end
        return count
      else
        "error"
      end
    end

  end
end
