module Scrabble
  class Scrabble
    VALUES = {a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1, t: 1,
      d: 2, g: 2,
      b: 3, c: 3, m: 3, p: 3,
      f: 4, h: 4, v: 4, w: 4, y: 4,
      k: 5,
      j: 8, x: 8,
      q: 10, z: 10
    }

    # self.score(word): returns the total score value for the given word
    def self.score(word) # word is input as a string (case insensitive)
      score = 0
      letters = word.downcase.chars

      letters.each do |letter|
        score += VALUES[letter.to_sym]
      end

      score
    end

  # self.highest_score_from(array_of_words): returns the word in the array with the highest score.
  # Note that it’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters.
  # Note that there is a greater bonus for using all seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
  # If the there are multiple words that are the same score and same length, pick the first one in supplied list
    def self.highest_score_from(array_of_words)
      score_check = array_of_words.group_by { |word| Scrabble.score(word) }
      top_words_by_score = score_check[score_check.keys.max] # returns an array of word(s) that have the max score

      # If there are no ties, return the top word
      return top_words_by_score[0] if top_words_by_score.length == 1

      # Handle ties
      tied_grouped_by_length = top_words_by_score.group_by { |words| words.length }

      # If one has 7 characters, it wins
      seven_chars = check_for_7_chars(array_of_words, tied_grouped_by_length)
      return seven_chars if seven_chars

      # Otherwise, find shortest word
      least_chars = find_shortest(array_of_words, tied_grouped_by_length)
      return least_chars

    end

    def self.check_for_7_chars(original_words, tied_words)
      if tied_words[7] # there are words with 7 characters
        return determine_win_if_7_tiles(original_words, tied_words[7])
      end
    end

    def self.determine_win_if_7_tiles(original_words, seven_char_top_words)
      # if there's no tie, return word
      return seven_char_top_words[0] if seven_char_top_words.length == 1

      # if there's a tie, return the 7-tile word that shows up first in the original array of words
      return Scrabble.find_first_in_original(original_words, seven_char_top_words)
    end

    def self.find_shortest(original_words, tied_words)
      shortest_word_length = tied_words.keys.min
      shortest_tied_words = tied_words[shortest_word_length]

      if shortest_tied_words.length == 1 # if true, there is only one shortest word. No ties.
        return shortest_tied_words[0]
      else # there are ties for shortest word with highest score
        # return the word that shows up first
        return Scrabble.find_first_in_original(original_words, shortest_tied_words)
      end

    end

    def self.find_first_in_original(original_words, tied_words)
      original_words.each do |word|  # loop through original array....
        tied_words.each do |top_word|         # and compare each word to the list of ties....
          return word if top_word == word     # and if the original array word matches a tie, return the that word.
        end
      end
    end

  end # ends class
end # ends module
