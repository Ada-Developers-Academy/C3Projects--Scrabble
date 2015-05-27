module Scrabble

  class Scrabble
    # Set constants with general error message, point values of each letter, all letters
    WORD_ERROR = "ERROR: Invalid input. Scrabble uses WORDS."
    POINTS = {
      1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
      2 => ["d", "g"],
      3 => ["b", "c", "m", "p"],
      4 => ["f", "h", "v", "w", "y"],
      5 => ["k"],
      6 => ["j", "x"],
      7 => ["q", "z"]
    }

    LETTERS = ("a".."z").to_a

    # attr_accessor :score, :word_array
    #
    # def initialize
    #   @score = 0
    #   @word_array = []
    # end

    def self.get_points(word_array)
      # set initial value of score
      score = 0
      # for each letter in word_array, check POINTS and add to total to create score
      word_array.each do |letter|
        for num in 1..7
          if POINTS[num].include?(letter)
            score += num
          end
        end
      end
      return score
    end

    # Check input to guard against empty, nil, or invalid parameter
    def self.valid_input?(word)
      word = word.to_s.downcase

      if (word == "") || (word == nil) || (word.split("").all? { |letter| !LETTERS.include?(letter) })
        valid = false
      else
        valid = true
      end
    end

    def self.score(word)
      # convert to string, make letters lower case, & push letters to array
      word_array = word.to_s.downcase.split("").push

      if self.valid_input?(word) == false
        WORD_ERROR
      else
        self.get_points(word_array)
      end
    end

    def self.highest(array_of_words)
      hash_of_scores = {}
      array_of_words.each { |word, score|
        score = self.get_points(word.to_s.downcase.split("").push)
        hash_of_scores[word] = score

        }
      max = hash_of_scores.key(hash_of_scores.values.max)
      return max
    end

    def self.highest_score_from(array_of_words)
      if array_of_words.all? { |word| self.valid_input?(word)}
        # if self.valid_input?(word) == true
        self.highest(array_of_words)
      else
        WORD_ERROR
      end
    end

  end

end
