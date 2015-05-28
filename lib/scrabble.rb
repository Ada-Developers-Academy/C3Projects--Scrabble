module Scrabble

LETTER_VALUES = [
  [1, "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  [2, "D", "G"],
  [3, "B", "C", "M", "P"],
  [4, "F", "H", "V", "W", "Y"],
  [5, "K"],
  [8, "J", "X"],
  [10, "Q", "Z"]
]

class Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'
  require "awesome_print"

def self.letter_score(letter)
  LETTER_VALUES.each do |letter_value_array|
      if letter_value_array.include?(letter.upcase)
        value = letter_value_array[0]
        return value
      end
  end
end

def self.score(word)
  #&& word_array.empty? == false (to test empty input)
  #splits word into array of letters
  word_array = word.upcase.split(//)
  letters = ("A".."Z")

  word_array.each do |letter|
    unless letters.include?(letter) and word_array.length <= 7
      return "Error"
    end
  end

  #runs each letter through letter_score methods and scores it
  word_values = []
  word_array.each do |letter|
    value = Scrabble.letter_score(letter)
    word_values << value
  end

  #sums array of individual letter values
  score = 0
  word_values.each do |value|
    score += value
  end

  return score
end

def self.highest_score_from(array_of_words)
  value_array = []

  #pair scores with words in a new array
  array_of_words.each do |word, value|
    value = Scrabble.score(word)
    word.downcase
    value_array << [value, word]
  end

  #sorts array of word/score pairs and sets the array with the highest score as max_word_array
  value_array = value_array.sort
  max_word_array = value_array[-1]

  #compares word/score array with max_word_array to check for ties in scores
  tied_words = []
  value_array.each do |array|
    if max_word_array[0] == array[0]
      tied_words << array[1]
    end
  end

  #finds smallest word of the tie
  smallest = tied_words.min_by { |word| word.length }

  #loops through tied words to check if any are equal to 7 letters
  tied_words.each do |word|
    if word.length == 7
      return word
    end
  end

  # if none of the tied words are equal to 7, the smallest word is returned
  return smallest
end

end #class end
end #module end

