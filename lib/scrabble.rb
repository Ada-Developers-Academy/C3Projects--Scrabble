module Scrabble ##require your gems and classes here # require_relative 'scrabble/whatevs'

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

      return "Must pick a letter!" unless word[/[a-zA-Z]+/] == word && word.length > 0
      #If the input is a character that isn't a letter, or if it's an empty string, it brings up an error

      # empty array to iterate through each letter of the split word
      score_array = []

      #assign split word array to a variable
      split_letter_array = letters_in_word(word)

      #for each letter in the array of individual letters, I pushed the matching letters from SCOREBOARD to score_array
      #SCOREBOARD[letter.upcase] gives me the score value from my SCOREBOARD hash
      split_letter_array.each do |letter|
        score_array.push(SCOREBOARD[letter.upcase])
      end


      sum = 0
      # for each letter
      score_array.each do |score|
        sum += score.to_i #adds all the letter scores together
      end
      #returns the sum/score of all letters
      return sum
    end

    def self.highest_score_from(array_of_words)

      #if the array is empty, it raises an error
      if array_of_words.empty?
        puts "Your array of words is empty. Add some words in there!"
      end

      # if there is a word that contains things other than letters, it brings up an error.
      array_of_words.each do |word|
        puts "Use only letters! Try again" unless word[/[a-zA-Z]+/]  == word && word.length > 0
      end

      #picks highest scoring words from array_of_words
      highest_score = array_of_words.max_by { |word| score(word) }
      #picks highest scoring words from array_of_words

      tied_words = array_of_words.select { |word| score(word) == score(highest_score) }
      #select all words with highest score including ties
      minimum_words = tied_words.min_by { |word| word.length }
      # from tied_words array, it finds the shortest word

      seven_letters = tied_words.find { |word| word.length == 7}
      # tried to find the word with 7 letters from tied_words array

      tied_words.each do |word|
        if word.length == 7
          seven_letters
        elsif word.length < 7
          minimum_words
        end
        return seven_letters || minimum_words
        # prefers 7 lettered words when tied. if tied words arent 7 letters, then it returns the shortest word
      end

    end
  end

end
