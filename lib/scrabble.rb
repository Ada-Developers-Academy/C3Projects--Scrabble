module Scrabble
require "awesome_print"

  class Scrabble
    #___________________________________________________________________________
    # Constants

    SCORE_1 =  ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    SCORE_2 =  ["D", "G"                                        ]
    SCORE_3 =  ["B", "C", "M", "P"                              ]
    SCORE_4 =  ["F", "H", "V", "W", "Y"                         ]
    SCORE_5 =  ["K"                                             ]
    SCORE_8 =  ["J", "X"                                        ]
    SCORE_10 = ["Q", "Z"                                        ]
    #___________________________________________________________________________
    # Class method score

    def self.score(word)

      # the complex if statement verifies that argument in method:
      # it's not a number and is not string "0"
      # length isn't bigger than 7 letters
      # there is no spaces

      if (word.to_i.class == Fixnum && (word.to_i != 0 || word == "0" || word == 0)) || (word.length > 7 || word.split() != [word])
          return "Error!"
        else
          word = word.upcase
       end

      # turnig word into array of letters
      # matching every letter of the word with the letters in Constants arrays, to get the score

      word = word.split("")
      score = []
        word.each do |letter|
          if SCORE_1.include?(letter)
            score.push(1)
          elsif
            SCORE_2.include?(letter)
            score.push(2)
          elsif
            SCORE_3.include?(letter)
            score.push(3)
          elsif
            SCORE_4.include?(letter)
            score.push(4)
          elsif
            SCORE_5.include?(letter)
            score.push(5)
          elsif
            SCORE_8.include?(letter)
            score.push(8)
          else
            SCORE_10.include?(letter)
            score.push(10)
          end
        end
        score = score[0].to_i + score[1].to_i + score[2].to_i + score[3].to_i + score[4].to_i + score[5].to_i + score[6].to_i
      return score
    end
    #___________________________________________________________________________
    # Class method highes_score_from(array_of_words)

    def self.highest_score_from(array_of_words)

      if array_of_words.empty?
        return "Error, provide words, please"
      end

      # Grouping the array_of_words by scores of the words => hash
      # Finding the highest score, i.e. the key of the hash
      # Returning the value of the highest key, i.e. array of words

      group_by_score = array_of_words.group_by {|word| score(word)}
      highest_score = group_by_score.keys.max
      words_with_highest_score = group_by_score[highest_score]

      if words_with_highest_score.length == 1
        return words_with_highest_score[0]
      elsif words_with_highest_score.length > 1
        # creating a new variable with random sting value which will be reaplaced with a win_word
        win_word = "blablabla"
        words_with_highest_score.each do |word|
          # checks if there's a word of 7 letters, if is true, then returns this word and breaks the loop
          if word.length == 7
            win_word = word
          break
          # returns the shortest word
          elsif win_word.length != 7 && word.length < win_word.length
            win_word = word
          end
        end
      return win_word
      end
    end
  end
end

#_______________________________________________________________________________
# some tests to check how the class methods work

# ap Scrabble::Scrabble.score("peace")
# ap Scrabble::Scrabble.highest_score_from(["peace", "life", "pencil", "chalk", "quarter"])
