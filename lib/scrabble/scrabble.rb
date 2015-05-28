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

    # .score(word): returns the total score value for the given word [breakfast]
    def self.score(word) # word is input as a string (case insensitive)
      score = 0
      letters = word.downcase.chars

      letters.each do |letter|
        score += VALUES[letter.to_sym]
      end

      score
    end

    # .highest_score_from(array_of_words): returns the word in the array with the highest score [breakfast]
    def self.highest_score_from(array_of_words)
      score_check = array_of_words.group_by { |word| Scrabble.score(word) }
      top_words = score_check[score_check.keys.max] # returns an array of word(s) that have the max score

      # if there are no ties, return the top word
      if top_words.length == 1
        top_words[0]
      else # handle ties
        Scrabble.handle_ties(array_of_words, top_words)
      end
    end

    # chooses winning word if there's a tie for highest-scoring [helper for .highest_score_from]
    def self.handle_ties(original_words, top_words)
      grouped_ties = top_words.group_by { |words| words.length }

      # [breakfast]: Note that there is a greater bonus for using all seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
      if grouped_ties[7] != nil # does >= 1 word have 7 characters?
        tied_7_char_words = grouped_ties[7]

        if tied_7_char_words.length == 1 # there's no tie, return word
          tied_7_char_words[0]
        else # there's a tie, return the 7-tile word that shows up first in the original array of words
          Scrabble.find_first_in_original(original_words, tied_7_char_words)
        end

      # [breakfast]: Note that it’s better to use fewer tiles, so if the top score is tied between multiple words, pick the one with the fewest letters.
      else
        shortest_tied_words = grouped_ties[ grouped_ties.keys.min ]

        if shortest_tied_words.length == 1 # if true, there is only one shortest word. No ties.
          shortest_tied_words[0]
        else # there are ties for shortest word with highest score
          Scrabble.find_first_in_original(original_words, shortest_tied_words)
        end
      end
    end

    # [breakfast]: If the there are multiple words that are the same score and same length, pick the first one in supplied list
    def self.find_first_in_original(original_words, tied_words)
      original_words.each do |word|       # loop through original array....
        tied_words.each do |top_word|     # and compare each word to the list of ties....
          return word if top_word == word # and if the original array word matches a tie, return the that word.
        end
      end
    end

  end # ends class
end # ends module
