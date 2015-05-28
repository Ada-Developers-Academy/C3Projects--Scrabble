module Scrabble
  require "awesome_print"
  require "pathname"
  require "csv"
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  PROJECT_ROOT = Pathname(__dir__).parent

  require_relative PROJECT_ROOT.join('lib/scrabble/scrabble')
  require_relative PROJECT_ROOT.join('lib/scrabble/player')
  require_relative PROJECT_ROOT.join('lib/scrabble/tilebag')
end
