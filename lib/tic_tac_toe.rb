WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player_token)
  board[index] = current_player(board)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turnCount = 0
  board.each do |space|
    space == "X" || space == "O" ? turnCount += 1 : turnCount
  end
  return turnCount
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
       return win_combination
   end
 end
 return nil
end

def full?(board)
board.none?{ |i| i == " "}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else if (!(full?(board)) && !(won?(board))) || !(full?(board))
    return false
  end
end
end

def over?(board)
won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo != nil
    return board[winning_combo[0]]
  else
    return nil
  end
end

#def play(board)
#  turn(board)
#  draw?(board)
#  input = gets
#end

def play(board)
  loop_count = 0
  until loop_count == 9
    turn(board)
    loop_count +=1
  end
end
