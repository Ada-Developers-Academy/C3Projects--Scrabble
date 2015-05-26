class Scrabble

  ONE_POINT = ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"]
  TWO_POINTS = ["d", "g"]
  THREE_POINTS = ["b", "c", "m", "p"]
  FOUR_POINTS = ["f", "h", "v", "w", "y"]
  FIVE_POINTS = ["k"]
  EIGHT_POINTS = ["j", "x"]
  TEN_POINTS = ["q", "z"]

  SCORES = [
    {score: 1,
    letters: ONE_POINT},
    {score: 2,
    letters: TWO_POINTS},
    {score: 3,
    letters: THREE_POINTS},
    {score: 4,
    letters: FOUR_POINTS},
    {score: 5,
    letters: FIVE_POINTS},
    {score: 8,
    letters: EIGHT_POINTS},
    {score: 10,
    letters: TEN_POINTS}
  ]

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
      # Edge case - no numbers in your inputed word
      if (char >= "a") && (char <= "z")
        # Add the points associated with the letter "char" to the word_score
        SCORES.each do |hash|
          if hash[:letters].include?(char)
            word_score += hash[:score]
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
      if current_word_score > highest_score
        highest_score = current_word_score
        best_word = current_word
      end
    end
  end
end
