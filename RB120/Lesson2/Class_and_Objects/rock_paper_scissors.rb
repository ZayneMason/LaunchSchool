class Player
  attr_reader :move
  def initialize
    puts "Choose a move....\n-'r'for rock\n-'p' for paper\n-'s' for scissors"
    @move = gets.chomp.downcase
    initialize if ['r','p','s'].include?(@move) == false
  end
end

class Bot
  attr_reader :move
  def initialize
    @move = ['r', 'p', 's'].sample
  end
end

class Game
  def initialize
    puts "Welcome to rock paper scissors!"
    player = Player.new
    bot = Bot.new
    self.compare(player.move, bot.move)
    new_game
  end

  def compare(move1, move2)
    if move1 == move2
      puts "Tie. You and the bot both chose #{move1}"
    end
    if (move1 == 'r' && move2 == 's' || move1 == 's' && move2 == 'p')
      puts "You win! Bot chose #{move2}"      
    else
      puts "You lose! Bot chose #{move2}"
    end
  end

  def new_game
    puts "Play again? (y/n)"
    @reset = gets.chomp.downcase
    initialize if @reset == 'y'
  end
end

game = Game.new
