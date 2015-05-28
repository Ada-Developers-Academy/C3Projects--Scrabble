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

    #Turns the word into an array
    def self.split_word(word)
      letters = word.upcase.split(//)

      # Guard clause for weird characters
      letters.each {|letter|
        unless letter >= "A" && letter <= "z"
          return "That's not a word!"
        end
      }
    end

    def self.convert_scores(word)
      tile_scores = []
      letter_array = split_word(word)
      letter_array.each do |letter|
      tile_scores.push(SCORE_TABLE[letter])
      end
        # Now create the sum of the array
      sum = 0
      tile_scores.each do |score|
        sum += score
      end
      return sum
    end

    def self.score(word)
      #Guard clause for numbers
      return "Not a word!" unless word.to_i == 0

      #Guard clause for nil
      return "Yeah, silence is golden. But I still need a word" if word == nil || word == ""

      #Guard clause for over seven letters
      return "Your word exceeds 7 letters! What are you, a sesquipedalian (a person who uses big words)?" if word.length > 7

      split_word(word)
      convert_scores(word)
    end

# ____________ARRAY OF WORDS__________

    def self.match_scores_and_words(word_array)
      # This adds scores to a new array
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

    def self.check_for_seven(array_of_words)
      array_of_words.sort_by! {|words| words.length}
      if array_of_words.last.length == 7
        return true
      else
        return false
      end
    end

    def self.choose_short_word(array_of_words)
    #Guard clause
    match_array = match_scores_and_words(array_of_words)

    same_scores = match_array.select {|pair| pair.include? "20"}
    same_scores.sort_by! {|pair| pair.length}

    short_word = same_scores.first.split(" : ")
    long_word = same_scores.last.split(" : ")

    if long_word[1].length == 7
      return "Congrats, seven word bonus!"
    else
      short_word[1]
      end

    end



    def self.top_word(array_of_words)
      high_score = match_scores_and_words(array_of_words)
      win_word = high_score.sort.first.split(" : ")
      win_word[1]
    end

    def self.highest_score_from(array_of_words)

    words_scores = match_scores_and_words(array_of_words)

    #Edge clause for short words and same scores
    if words_scores.select {|pair| pair.include? "20"}
      choose_short_word(array_of_words)
    else
      top_word(array_of_words)
    end


    end

  end

end

# if same_scores[0].length == same_scores[1].length
#   win_word = same_scores.first.split(": ")
#   win_word[1]
# end
