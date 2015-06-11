require 'pry'
module Scrabble ##require your gems and classes here # require_relative 'scrabble/whatevs'

  SCOREBOARD = {
    "A" => 1,  "E" => 1, "I" => 1, "O" => 1, "U" => 1,
    "L" => 1,  "N" => 1, "R" => 1, "S" => 1, "T" => 1,
    "D" => 2,  "G" => 2,
    "B" => 3,  "C" => 3, "M" => 3, "P" => 3,
    "F" => 4,  "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
    "K" => 5,
    "J" => 8,  "X" => 8,
    "Q" => 10, "Z" => 10,
  }

  class Scrabble


    def self.score(word)

      if word[/[a-zA-Z]+/] != word || word.length < 1
      # if the input isn't a valid character OR word has 0 letters ("" or nil), then it raises an error
        raise ArgumentError.new("Must input a valid letter!")
      end

      word_split = word.chars
      # setting the array of split words into a variable

      score_array = word_split.map do |letter|
        SCOREBOARD[letter.upcase]
      end

      sum = 0

      score_array.each do |score|
        sum += score.to_i #adds all the letter scores together
      end
      return sum
    end

    def self.highest_score_from(array_of_words)

      #if the array is empty, it raises an error
      if array_of_words.empty?
        puts "Your array of words is empty. Add some words in there!"
      end

      # if there is a word that contains things other than letters, it brings up an error.
      array_of_words.each do |word|
        if (word[/[a-zA-Z]+/]  != word) || (word.length < 1)
        puts "Use only letters! Try again"
        end
      end

      highest_score = array_of_words.max_by { |word| score(word) }
      #picks highest scoring words from array_of_words

      tied_words = array_of_words.select { |word| score(word) == score(highest_score) }
      #select all words with highest score including ties

      shortest_word = tied_words.min_by { |word| word.length }
      # finds the shortest word from the tied_words array

      seven_letters = tied_words.find { |word| word.length == 7}
      # finds the word with 7 letters from tied_words array
      # if there are multiple 7-letter words that are tied, it will pick the first one in the array due to the "find" method

      if seven_letters
        return seven_letters
        # in a tie, returns word with 7 letters or the first tied word with 7 letters
      end
        return shortest_word
        # this will happen no matter what (no 7 letter words), so I don't need an else statement
    end
  end

end
