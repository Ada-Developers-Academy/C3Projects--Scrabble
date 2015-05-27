require 'pathname'
require 'awesome_print'

module Scrabble
  # require your gems and classes here
  require_relative('scrabble_class')
end

x= Scrabble::Scrabble.score("probably")
ap x

# score= Scrabble::Scrabble.new
# chart = score.score_assignment
# puts chart
