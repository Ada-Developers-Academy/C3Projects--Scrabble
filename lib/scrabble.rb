module Scrabble

LETTER_VALUES = [
  [2, "D", "G"],
  [1, "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
]

class Scrabble
  # require your gems and classes here
  # require_relative 'scrabble/whatevs'

def self.letter_score(letter)
  LETTER_VALUES.each do |letter_value_array|
      if letter_value_array.include?(letter.upcase)
        value = letter_value_array[0]
        return value
      end
  end
end

def self.score(word)
  #checks for numbers in input
  return "Error" if word.to_i != 0
  #checks for nil in input
  return "Error" if word == nil

  #splits word into array of letters
  word_array = word.split(//)

  #runs each letter through letter_score and scores it
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

def self.highest_score_form(array_of_words)
  #returns the word in the array with the highest word

end


end #class end

end #module end

