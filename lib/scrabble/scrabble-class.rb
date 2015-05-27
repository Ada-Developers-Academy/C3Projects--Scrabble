class Scrabble
  SCORES = {
    1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
    2 => ["d", "g"],
    3 => ["b", "c", "m", "p"],
    4 => ["f", "h", "v", "w", "y"],
    5 => ["k"],
    8 =>["j", "x"],
    10 => ["q", "z"]
  }

  def self.score(word)
    # Edge case - no input, less than 8 letters
    if word == "" || word == nil || word.length > 7
      return "ERROR"
    end

    # Starts word_score at zero
    word_score = 0
    word.downcase!

    # Count points letter by letter
    word.each_char do |char|
      # Edge case - no numbers/spaces/weird things in your inputed word
      if (char >= "a") && (char <= "z")
        # Add the points associated with the letter "char" to the word_score
        SCORES.select do |key, value|
          if value.include?(char)
            word_score += key
          end
        end
      else
        return "ERROR"
      end
    end

    return word_score
  end

  def self.highest_score_from(array_of_words)
    highest_score = 0
    best_word = nil

    array_of_words.each do |current_word|
      current_word_score = score(current_word)
      # Replaces best_word if the current_word has a higher score
      if current_word_score > highest_score
        highest_score = current_word_score
        best_word = current_word
      # If the words have the same score, it will take the shortest word or 7 letter word
      elsif current_word_score == highest_score && current_word.length < best_word.length && best_word.length != 7
        highest_score = current_word_score
        best_word = current_word
      end
    end

    return best_word
  end
end
