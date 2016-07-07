# transformation rules:
#  - go through each character:
#    - if the character is a space, then transform it into the number of surrounding mines 
#      - number of surrounding mines:
#        - assume the current char is at (x, y)
#        - the surronding position are: (x-1, y-1), (x-1, y), (x-1, y+1), (x, y-1), (x, y+1), (x+1, y-1), (x+1, y), (x+1, y+1)
#        - count and return the number of surrounding positions with character "*"
#    - for all other instances (not a spece char), then keep the same char
# - faulty border rule and valid char rule
#   - for the first and last row:
#     - begins and ends with a "+", with all "-"s in the middle
#   - for the middle row
#     - begins and ends with a "|", with either "*" and " " in the middle
# - valid character??

class ValueError < StandardError; end

class Board
  def self.transform(input)
    validate_input(input)
    output = Array.new(input.size) { Array.new(input[0].size) }
    input.each_with_index do |row, x|
      row.chars.each_with_index do |char, y|
        output[x][y] = new_position_char(char, x, y, input) 
      end
    end
    output.map(&:join)
  end

  def self.new_position_char(char, x, y, input)
    if char == ' '
      number_of_mines = number_of_surrounding_mine(x, y, input)
      if number_of_mines == 0
        ' '
      else
        number_of_mines.to_s
      end
    else
      char
    end
  end

  def self.number_of_surrounding_mine(x, y, input)
    [input[x-1][y-1], input[x-1][y], input[x-1][y+1], input[x][y-1], input[x][y+1], input[x+1][y-1], input[x+1][y], input[x+1][y+1]].count('*')
  end
  
  def self.validate_input(input)
    #input.all? { |row| row.size == input[0].size }
    fail ValueError, 'Input needs to have rows of the same length' unless rows_of_the_same_length?(input)
    fail ValueError, 'Invalid board pattern' unless valid_board_pattern?(input)
  end

  def self.rows_of_the_same_length?(input)
    input.map(&:size).uniq.size == 1
  end

  def self.valid_board_pattern?(input)
    first_row, last_row = input[0], input[-1]
    first_row.match(/^\+-*\+$/) && last_row.match(/^\+-*\+$/) && valid_middle_rows?(input)
  end

  def self.valid_middle_rows?(input)
    input[1..-2].all? { |row| row.match(/^\|(\*|\ )*\|$/)}
  end
end
