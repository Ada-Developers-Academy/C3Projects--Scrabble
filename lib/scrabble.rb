module Scrabble
  # require your gems and classes here
  require_relative './scrabble_class'
end

words = ["lil", "sfgsgs", "lja", "aiouuyg", "oiouuyg"]
puts Scrabble::Scrabble.highest_score_from(words)

