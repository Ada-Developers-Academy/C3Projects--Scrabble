module Scrabble
  ##----------------
  # GEM DEPENDENCIES


  # required for dessert / dictionary
  require "csv"

  # required for testing only (display intelligent results)
  require "awesome_print"


  ##-----------------
  # FILE DEPENDENCIES


  # breakfast
  require_relative 'scrabble/scrabble'

  # lunch
  require_relative 'scrabble/player'

  # dinner
  require_relative 'scrabble/tilebag'

  # dessert
  require_relative 'scrabble/board'
  require_relative 'scrabble/dictionary'
  require_relative '../support/dictionary.csv'
end
