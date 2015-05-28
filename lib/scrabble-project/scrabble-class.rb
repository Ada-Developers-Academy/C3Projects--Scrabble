module Scrabble

  class Scrabble
    # Set constants with general error message, point values of each letter, all letters
    WORD_ERROR = "ERROR: Invalid input. Either your word has more that 7 letters or you entered something ridiculous. You only have 7 tiles, and Scrabble uses WORDS!"
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

    # Check input to guard against empty, nil, or otherwise invalid parameter
    # Word length cannot exceed 7
    def self.valid_input?(word)
      word = word.to_s.downcase

      if (word == "") || (word == nil) || (word.length > 7) || (word.split("").all? { |letter| !LETTERS.include?(letter) })
        valid = false
      else
        valid = true
      end
    end

    def self.score(word)
      # convert to string, make letters lower case, & push letters to array
      word_array = word.to_s.downcase.split("").push

      # error if invalid input
      if self.valid_input?(word) == false
        WORD_ERROR
      # run get_points if valid input
      else
        self.get_points(word_array)
      end
    end

    def self.highest(array_of_words)
      # create empty hash
      hash_of_scores = {}

      # for each word, get points, add word => point pairs to hash
      array_of_words.each { |word, score|
        score = self.get_points(word.to_s.downcase.split("").push)
        hash_of_scores[word] = score
        }

      # group by score
      grouped_hash = hash_of_scores.group_by { |key, value| value }

      # create max_group, the hash item with the max value.
      max_group = grouped_hash.max[1]
      # distill max_group down to only the words.
      max_group = max_group.map {|item| item[0]}

      # if there is a word in the max_group with length of 7, return it
      if max_group.find { |word| word.length == 7 }
        return max_group.find { |word| word.length == 7}

      # otherwise, return the shortest word in group.
      else
        return max_group.min_by {|word| word.length}
      end

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
