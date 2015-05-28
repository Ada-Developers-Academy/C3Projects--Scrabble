module Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  # require dependent files
  require_relative 'scrabble-project/scrabble-class'
  require_relative 'scrabble-project/player'
end

x = Scrabble::Player.new("Voltron")
puts x.name
x.play("helmet")
puts x.plays
x.play("elephant")
puts x.plays
