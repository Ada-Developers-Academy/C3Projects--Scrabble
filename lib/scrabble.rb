module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  # require dependent files
  require_relative 'scrabble-project/scrabble-class'
end

x = Scrabble::Scrabble.highest_score_from(["dog", "cat", "hi", "a", "to"])
puts x
