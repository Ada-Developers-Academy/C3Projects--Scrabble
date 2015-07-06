# Create a Board class that has a matrix (array of arrays) of tile places. Check if a word can be played on a given tile place in a certain direction.
# Include a minimum of 20 specs between the Dictionary and Board classes.

module Scrabble
  class Board


    attr_accessor :board


    ##--------------------------------------------------------------------------
    # INSTANCE METHODS (PUBLIC)


    def initialize
      create_board
    end


    def play(word, start_here, in_direction) #!W DRY?
      # return false unless this is a legal play!
      unless is_legal_play?(word, start_here, in_direction)
        return false
      end

      letters = word.length
      row = start_here[:row]
      column = start_here[:column]

      if (in_direction == "over")
        letters.times do |count|
          @board[row][column + count] = word[count]
        end

        return true

      elsif (in_direction == "down")
        letters.times do |count|
          @board[row + count][column] = word[count]
        end

        return true

      else
        return false
      end
    end


    private
    ##--------------------------------------------------------------------------
    # PRIVATE METHODS (INSTANCE)


    def create_board
      # set the size of the board.
      board_size = 15

      # set placeholder values for board creation.
      @board = []
      row = []
      cell = ""

      # populate the row with cells.
      board_size.times do
        row.push(cell.dup)
      end

      # populate the board with rows of cells.
      board_size.times do
        @board.push(row.dup)
      end

      # return true, because a board was created.
      return true
    end


    # this is a beast!
    def is_legal_adjacent?(letter, row, column, direction) #!W DRY?
      adjacent_word = ""

      if (direction == "over")
        up_count = 0
        down_count = 0

        # check for non-empty spaces going up
        while (row - up_count) >= 0
          current_letter = @board[row - up_count][column]

          if current_letter != ""
            adjacent_word += current_letter
          else
            break
          end

          up_count -= 1
        end

        adjacent_word.reverse!
        adjacent_word += letter

        # check for non-empty spaces going down
        while (row + up_count) < 15
          current_letter = @board[row + up_count][column]

          if current_letter != ""
            adjacent_word += current_letter
          else
            break
          end

          up_count += 1
        end

      elsif (direction == "down")
        left_count = 0
        right_count = 0

        # check for non-empty spaces going up
        while (column - left_count) >= 0
          current_letter = @board[row][column - left_count]

          if current_letter != ""
            adjacent_word += current_letter
          else
            break
          end

          left_count -= 1
        end

        adjacent_word.reverse!
        adjacent_word += letter

        # check for non-empty spaces going down
        while (column + right_count) < 15
          current_letter = @board[row][column + right_count]

          if current_letter != ""
            adjacent_word += current_letter
          else
            break
          end

          right_count += 1
        end
      end

      score = Scrabble.score(adjacent_word)

      if (score.class == Fixnum)
        return true
      else
        # puts score
        return false
      end
    end


    # this is a beast!
    def is_legal_play?(word, start_here, in_direction) #!W DRY?
      distance = word.length
      row = start_here[:row]
      column = start_here[:column]
      adjacent_words = []

      if (in_direction == "over") && (column + distance) < 15
        distance.times do |count|
          current_letter = @board[row][column + count]

          # if the space is occupied, you can't put a letter there!
          if current_letter != ""
            return false
          end

          # if letters are adjacent, check for matching words.
          if (@board[row + 1][column + count] != "") || (@board[row - 1][column + count] != "")
            adjacent_word = is_legal_adjacent?(current_letter, row, column + count, in_direction)

            if adjacent_word
              adjacent_words.push(adjacent_word)
            else
              return false
            end
          end
        end

        return true

      elsif (in_direction == "down") && (row + distance) < 15
        distance.times do |count|
          current_letter = @board[row + count][column]

          # if the space is occupied, you can't put a letter there!
          if current_letter != ""
            return false
          end

          # if letters are adjacent, check for matching words.
          if (@board[row + count][column + 1] != "") || (@board[row + count][column - 1] != "")
            adjacent_word = is_legal_adjacent?(current_letter, row, column + count, in_direction)

            if adjacent_word
              adjacent_words.push(adjacent_word)
            else
              return false
            end
          end
        end

        return true

      else
        return false
      end
    end
  end
end
