module Scrabble

  # This is a Scrabble scoring system

  SCORE_TABLE =   {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
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

  private
#_______ Handling individual words _______

    #Turns the word into an array of letters
    def self.split_word(word)
      letters = word.upcase.split(//)

      # Guard clause for weird characters
      letters.each {|letter|
      unless ("A".."z").include?(letter)
        return "$top typing we!rd."
      end
      }
    end

    def self.convert_scores(word)
      # Creates an array to hold scores
      tile_scores = []
      letter_array = split_word(word)

      # Push corresponding scores into array
      letter_array.each do |letter|
        tile_scores.push(SCORE_TABLE[letter])
      end

      # Find the sum of the score array
      sum = 0
      tile_scores.each do |score|
        sum += score
      end
      sum
    end

    def self.score(word)
      #Guard clause for numbers
      return "Numb3rs don't c0unt!" unless word.to_i == 0

      #Guard clause for nil or blanks
      return "Yeah, silence is golden. But I still need a word" if word == nil || word == ""

      #Guard clause for words exceeding seven letters
      return "Your word exceeds 7 letters! What are you, a sesquipedalian? (I Googled it for you: noun, a person who uses big words)" if word.length > 7

      split_word(word)
      convert_scores(word)
    end

    #_______ Handling word arrays _______

    # Matches words and their scores like this:
    # [score : word, score: word]
    def self.match_scores_and_words(word_array)
      # Creates an empty array
      match_array = []
      word_array.each {|word|
        match_array.push(score(word))
      }

      # This matches scores to words
      match_array.length.times do |index|
      match_array[index] = match_array[index].to_s + " : " + word_array[index]
      end
      match_array
    end

    # What to do if two words have the same top score
    def self.choose_short_word(array_of_words, top_score)
      #Guard clause
      match_array = match_scores_and_words(array_of_words)

      same_scores = match_array.select {|pair| pair.include? top_score}
      same_scores.sort_by! {|pair| pair.length}

      short_word = same_scores.first.split(" : ")
      long_word = same_scores.last.split(" : ")

      # Guard clause for a seven-letter win
      if long_word[1].length == 7
        return long_word[1]
      else
        short_word[1]
      end

    end

    # When there's a single top-score word
    def self.top_word(array_of_words)
      high_score = match_scores_and_words(array_of_words)
      win_word = high_score.sort.first.split(" : ")
      win_word[1]
    end

    # The second breakfast requirement...finally :P
    def self.highest_score_from(array_of_words)
      # Grab the [score : word ] array
      words_scores = match_scores_and_words(array_of_words)

      #Snags the top score number
      top_score_pair = words_scores.sort[0].split(" : ")
      top_score = top_score_pair[0]

      #Edge clauses for short words and same-length words
      if words_scores.select {|pair| pair.include? top_score}
        # Chooses winner from multiple top-score words
        choose_short_word(array_of_words, top_score)
      else
        # Single top-score words
        top_word(array_of_words)
      end # conditional
    end # method
  end # class
end # module
