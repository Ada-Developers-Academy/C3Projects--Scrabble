POINTS = [
  ["A", 1], ["E", 1], ["I", 1], ["O", 1], ["U", 1],
  ["L", 1], ["N", 1], ["R", 1], ["S", 1], ["T", 1],
  ["D", 2], ["G", 2],
  ["B", 3], ["C", 3], ["M", 3], ["P", 3],
  ["F", 4], ["H", 4], ["V", 4], ["W", 4], ["Y", 4],
  ["K", 5],
  ["J", 8], ["X", 8],
  ["Q", 10], ["Z", 10]
]

module Scrabble
  class Scrabble

    # Returns the score of a word, also checking for non-letter characters
    # If the word contains 7 characters 50 bonus points are rewarded
    def self.score(word)
      alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
      word = word.upcase.chars
      score = 0
      (0..word.length).each do |index|
        if alphabet.include?(word[index])
          POINTS.each do |letter, point|
            word.each do |word_letter|
             if word.length > 7
              return "Please enter a valid word."
             elsif word_letter == letter
              score = score + point
             end
            end
          end
        else
          return "Please enter a valid word."
        end
      if word.length == 7
        score += 50
      end
      return score
      puts "You received #{score} points for #{word}."
     end
    end

    # Returns the word in the array with the highest score
    # If multiple words have the same score, the first one is returned
    # Unless the word has 7 characters
    def self.highest_score_from(array_of_words)
      # array_of_words = %w(cat horse farm piglet tractor spider)
      if (array_of_words == []) || (array_of_words.empty? == true)
        return "Error, please provide an array of words."
      end
      sorted_array = array_of_words.sort_by do |word|
        word.length
      end
      sorted_array.max_by do |word|
       self.score(word)
      end
    end

  end
end
