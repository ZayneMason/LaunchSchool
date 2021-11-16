# Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
# marking a square. The first player to mark 3 squares in a row wins.

# Nouns and verbs:
  #  Board
  #  Square
  #  Player
  #  - mark
  #  - play

class Board
  attr_accessor :grid
  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9].map {|index| index = Square.new(index)}
  end

  def empty_squares
    @grid.select{|square| ("1".."9").include?(square.status)}
  end

  def tie?
    true if (@grid.map {|square| ("1".."9").include?(square.status)}.include?(true) == false) &&
            (self.x_win? == false && self.o_win? == false)
  end
  
  def x_win?
    true if ((@grid[0].status + @grid[1].status + @grid[2].status) == "XXX" || # Row 1
             (@grid[3].status + @grid[4].status + @grid[5].status) == "XXX" || # Row 2
             (@grid[6].status + @grid[7].status + @grid[8].status) == "XXX" || # Row 3
             (@grid[0].status + @grid[3].status + @grid[6].status) == "XXX" || # Column 1
             (@grid[1].status + @grid[4].status + @grid[7].status) == "XXX" || # Column 2
             (@grid[2].status + @grid[5].status + @grid[8].status) == "XXX" || # Column 3
             (@grid[0].status + @grid[4].status + @grid[8].status) == "XXX" || # Diag 1
             (@grid[2].status + @grid[4].status + @grid[6].status) == "XXX")   # Diag 2
  end

  def o_win?
    true if ((@grid[0].status + @grid[1].status + @grid[2].status) == "OOO" || # Row 1
             (@grid[3].status + @grid[4].status + @grid[5].status) == "OOO" || # Row 2
             (@grid[6].status + @grid[7].status + @grid[8].status) == "OOO" || # Row 3
             (@grid[0].status + @grid[3].status + @grid[6].status) == "OOO" || # Column 1
             (@grid[1].status + @grid[4].status + @grid[7].status) == "OOO" || # Column 2
             (@grid[2].status + @grid[5].status + @grid[8].status) == "OOO" || # Column 3
             (@grid[0].status + @grid[4].status + @grid[8].status) == "OOO" || # Diag 1
             (@grid[2].status + @grid[4].status + @grid[6].status) == "OOO")   # Diag 2
  end
  
end

class Square
  attr_accessor :status
  def initialize(marking)
    @original_status = marking.to_s
    @status = marking.to_s.dup
  end
  
  def taken?
    return true if @status != @original_status
    return false
  end
end

class Player
  attr_reader :symbol
  def initialize
    @symbol = "X"
  end

  def try_again(board)
    puts "Please choose an empty square within the board..."
    mark(board)
  end

  def mark(board)
    puts "Choose a square to mark...."
    square = gets.chomp.to_i
    (1..9).include?(square) == false || board.grid[square - 1].taken? ? try_again(board) : board.grid[square - 1].status = @symbol
  end
end

class Bot < Player
  def initialize
    @symbol = "O"
  end

  def mark(board)
    board.empty_squares.sample.status = "O"
  end
end

# Orchestration engine:

class TTTGame

  @@player1_wins = 0
  @@bot_wins = 0
  @@ties = 0

  def initialize
    @player1 = Player.new
    @bot = Bot.new
  end
  
  def welcome_message
    puts "Welcome to Tic Tac Toe!\n"
  end

  def goodbye_message
    puts "Goodbye and thanks for playing!\n"
  end

  def turns
    loop do
      @player1.mark(@board)
      display_board

      if @board.x_win?
        @@player1_wins += 1
        break
      end
      
      if @board.o_win?
        @@bot_wins += 1
        break
      end

      @bot.mark(@board)
      system "clear"
      display_board

      if @board.x_win?
        @@bot_wins += 1
        break
      end

      if @board.o_win?
        @@bot_wins += 1
        break
      end

    end
  end

  def again?
    puts "Play again? (y/n)"
    decision = gets.chomp.downcase
    decision == "y" ? true : false
  end

  def display_board
    puts ""
    puts "     |     |     "
    puts "  #{@board.grid[0].status}  |  #{@board.grid[1].status}  |  #{@board.grid[2].status}  "
    puts "     |     |     "
    puts "_____+_____+_____"
    puts "     |     |     "
    puts "  #{@board.grid[3].status}  |  #{@board.grid[4].status}  |  #{@board.grid[5].status}  "
    puts "     |     |     "
    puts "_____+_____+_____"
    puts "     |     |     "
    puts "  #{@board.grid[6].status}  |  #{@board.grid[7].status}  |  #{@board.grid[8].status}  "
    puts "     |     |     "
  end

  def play
    # Game outline here:
    # Welcome message
    welcome_message
    # General game loop:
    loop do
      # display board
      @board = Board.new
      display_board
      # loop until win || tie:
      turns
      system "clear"
      display_board
      # results
      puts "\n~POINTS~\nPlayer: #{@@player1_wins}\nBot: #{@@bot_wins}\nTies: #{@@ties}"
      # again?
      break if self.again? == false
      # End if no
    end
    # Exit message
    goodbye_message
  end
end

game = TTTGame.new
game.play
