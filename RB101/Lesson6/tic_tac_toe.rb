# Defining method to display board
def display_board(brd)
  puts ""
  puts "     |     |"
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[7]}   |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# Defining method to generate an empty board with placeholders
def startboard
  board_slots = {}
  (1..9).each { |slot| board_slots[slot] = slot }
  board_slots
end
# Defining method to check for a win condition
def winner?(brd)
  if brd[1] == brd[2] && brd[1] == brd[3]
    true
  elsif brd[4] == brd[5] && brd[4] == brd[6]
    true
  elsif brd[7] == brd[8] && brd[7] == brd[9]
    true
  elsif brd[1] == brd[5] && brd[1] == brd[9]
    true
  elsif brd[3] == brd[5] && brd[3] == brd[7]
    true
  elsif brd[1] == brd[4] && brd[1] == brd[7]
    true
  elsif brd[3] == brd[6] && brd[3] == brd[9]
    true
  elsif brd[2] == brd[5] && brd[2] == brd[8]
    true
  else
    false
  end
end
# Defining method to check for a draw
def draw?(brd)
  if brd.values.any? { |value| (1..9).include?(value) } == false && winner?(brd) == false
    true
  end
end

#Game loop
loop do

  board = startboard
  display_board(board)
  # Sub-loop for active play
  loop do
    # Player turn
    loop do
      puts '=> Please input your choice. (number marking space)'
      user_choice = gets.chomp.to_i
      if board[user_choice] == 'X' || board[user_choice] == 'O'
        puts '=> Please enter a space that is not taken.'
        next
      elsif (1..9).include?(user_choice) == false
        next
      else
        board[user_choice] = 'X'
      end
      display_board(board)
      break
    end
    # Checking for win or draw
    if draw?(board)
      puts "=> It's a draw!"
      break
    elsif winner?(board)
      puts '=> You win!'
      break
    end
    # Computer turn
    puts "=> Computer's move."
    loop do
      cpu_choice = (1..9).to_a.sample
      if board[cpu_choice] == 'X' || board[cpu_choice] == 'O' 
        next
      else
        board[cpu_choice] = 'O'
      end
      display_board(board)
      break
    end
    # Checking for win or draw
    if draw?(board)
      puts "=> It's a draw!"
      break
    elsif winner?(board)
      puts '=> Computer wins.'
      break
    end

  end
  # Asking player if they want to play again (restart loop)
  puts '=> Would you like to play again? (y/n)'
  decision = gets.chomp.downcase
  if decision == 'n'
    puts '=> Goodbye.'
    break
  else
    next
  end

end
