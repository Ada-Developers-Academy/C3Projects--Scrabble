# Create a Dictionary class that includes a method for searching a list of words to determine if a given word is a valid word.
# Include a minimum of 20 specs between the Dictionary and Board classes.

# require "./support/dictionary.csv"

module Scrabble
  ##---------------------------------
  # DEPENDENCIES FOR DICTIONARY CLASS

  require "csv" # to open & parse dictionary file
  # require_relative '../../support/dictionary.csv' # said dictionary file # !Q why doesn't this work. b/c not ruby file?


  class Dictionary
    # if I were building support for multiple languages or dictionary options,
    # this constant might become DICTIONARY_CTHULHU or DICTIONARY_EN. then
    # populate_dictionary might take an argument of which file to use as a
    # dictionary.
    DICTIONARY_FILE = "./support/dictionary.csv"


    attr_reader :dictionary


    def initialize
      # initialize dictionary attribute as an empty hash.
      @dictionary = Hash.new

      # fill the hash with data.
      populate_dictionary
    end


    private
    ##------------------------
    # PRIVATE INSTANCE METHODS

    # parses the dictionary file. :)
    def populate_dictionary
      # initialize counter with symbol of a (:a).
      count = :a

      # go through each line of the csv.
      CSV.read(DICTIONARY_FILE).each do |line|
        # initialize dictionary hash key of current counter to an empty array.
        @dictionary[count] = []

        # break line into words and add each word to the array for this line.
        line.each do |word|
          @dictionary[count].push(word)
        end

        # sort this line's words alphabetically & remove any repeats.
        @dictionary[count].sort!
        @dictionary[count].uniq!

        # increment counter (:a.next == :b).
        count = count.next
      end

      return true
    end
  end
end
