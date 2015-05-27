module Scrabble
  require "awesome_print"
  require "pathname"
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

  PROJECT_ROOT = Pathname(__dir__).parent

  require PROJECT_ROOT.join('lib/scrabble/scrabble')
  require PROJECT_ROOT.join('lib/scrabble/player')
end
