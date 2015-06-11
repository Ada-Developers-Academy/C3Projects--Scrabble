module Scrabble
  class Scrabble

    SCORING= {a: 1, b: 3, c: 3, d: 2, e: 1, f: 4,
      g: 2, h: 4, i: 1, j: 8, k: 5,
      l: 1, m: 1, n: 1, o: 1, p: 3,
      q: 10, r: 1, s: 1, t: 1, u: 1,
      v: 4, w: 4, x: 8, y: 4, z: 10}

    def self.score(word)
      #accounting for blank user input
      return 0 if word == ""
      return 0 if word == nil
      #accounting for a single digit non alphabetical character
      if word.to_i != 0 || word == "0"
        puts "Invalid input."
        return 0
      end
      if word.length > 7
        puts "Word length is limited to 7 letters."
        return 0
      end
      #splitting the word into an array of lowercase letters
      letters = word.downcase.split(//)
      #accounting for a multicharacter response that includes a non alphabetical character
      letters.each  do |x|
        if x.to_i != 0 || x == "0"
          puts "Your word contains an invalid character."
          return 0
        end
      end

      score = 0
      letters.each do |letter|
        score += SCORING[letter.to_sym]
      end
      return score
    end

     #returns the word in the array with the highest score.
    def self.highest_score_from(array_of_words)
      word_scores = array_of_words.group_by do |word|
        score(word)
      end

      high_score = word_scores.keys.max

      if word_scores[high_score].length > 1
        shortest, longest = word_scores[high_score].minmax_by do |word|
          word.length
        end

        if longest.length == 7
          winner = longest
        else
          winner = shortest
        end
        else
          winner = word_scores[high_score].first
      return winner
      end

      ##Below is what I was playing with before J + K livecoded in class. I was unable to pull the data out from the array of hashes. In hindsight my code was very convoluted and I need to become besties with enumerators
      # word_data = []
      # word_hash = {}
      # array_of_scores = []
      # array_of_words.each do |word|
      #   x = Scrabble.score(word)
      #   array_of_scores.push(x)
      #   word_hash = {:word => word, :score =>x, :length => word.length}
      #   word_data.push(word_hash)
      # end
      #
      # high_score = array_of_scores.max
      # puts high_score
      # word_data.each do |x|
      #   if word_data.fetch(:score) == high_score
      #     puts word_data.fetch(:word)
      #   end
      # end
      # return word_data
    end # end of method
  end # end of class
end # end of module
