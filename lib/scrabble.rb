module Scrabble #require your gems and classes here # require_relative 'scrabble/whatevs'

  SCOREBOARD = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10,
  }

  class Scrabble

    def self.letters_in_word(word)
      return word.split(//)
    end

    def self.score(word)

      score_array = [] # empty array to iterate through each letter of the split word

      split_letter_array = letters_in_word(word) #assign word.split array to variable
      split_letter_array.each do |letter| #for each letter in the array of individual letters,
        score_array.push(SCOREBOARD[letter.upcase]) #push the matching letters from SCOREBOARD to score array
      end

      sum = 0 #start sum to be at 0
      score_array.each do |score|
        sum += score #adds all the letter scores together
      end
      return sum
    end

    def self.highest_score_from(array_of_words)

      highest_score = array_of_words.max_by { |word| score(word) }
      #picks highest scoring words from array_of_words

      tied_words = array_of_words.select { |word| score(word) == score(highest_score) }
      #select all words with highest score including ties

      minimum_words = tied_words.min_by { |word| word.length }
      # from tie_words array, it finds the word with the least lettters

      seven_letters = tied_words.find { |word| word.length == 7}
      # tried to find the word with 7 letters from tied_words array

      tied_words.each do |word|
        if word.length == 7
          seven_letters
        elsif word.length < 7
          return minimum_words
        end
      end
    end

  end

end
