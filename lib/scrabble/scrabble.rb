module Scrabble
  class Scrabble

    def self.score(word)
      #accounting for blank user input
      return 0 if word == ""
      return 0 if word == nil
      #accounting for a single digit non alphabetical character
      if word.to_i != 0 || word == "0"
        puts "Invalid input."
        return 0
      end
      #case insensitive
      word = word.downcase
      #splitting the word into an array of letters
      letters = word.split(//)
      #accounting for a multicharacter response that includes a non alphabetical character
      letters.each  do |x|
        if x.to_i != 0 || x == "0"
          puts "Your word contains an invalid character."
          return 0
        end
      end

#BRENNA - OPTIMIZATION - Is it possible to pull this out into a method?
      score = 0
      letters.each do |letter|
        case letter
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
          score += 1

        when "d", "g"
          score += 2

        when "b", "c", "m", "p"
          score += 3

        when "f", "h", "v", "w", "y"
          score += 4

        when "k"
          score += 5

        when "j", "x"
          score += 8

        when "w", "z"
          score += 10
        end
      end
      return score
    end

     #returns the word in the array with the highest score.
    def self.highest_score_from(array_of_words)
      word_data = []
      word_hash = {}
      array_of_scores = []
      array_of_words.each do |word|
        x = Scrabble.score(word)
        array_of_scores.push(x)
        #### playing
        word_hash = {:word => word, :score =>x, :length => word.length}
        word_data.push(word_hash)
      end

      high_score = array_of_scores.max
      puts high_score
      word_data.each do |x|
        if word_data[x][:score] == high_score
          puts word_data[:word]
        end
      end
      return word_data
    end
  end
end
