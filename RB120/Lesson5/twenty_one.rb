# Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. If he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, then the highest total wins.
# - If both totals are equal, then it's a tie, and nobody wins.

# Nouns and verbs:
# - Player
#   - hit
#   - stay
#   - bust?
#   - total
# - Dealer
#   - hit
#   - stay
#   - bust?
#   - total
# - Deck
#   - deal
# - Card
# - Game
#   - start

# Player and dealer redundant, make superclass

class Participant

  def initialize
    @hand = []
    @stay = 0
  end

  def total
    @total = 0
    @hand.each { |card| @total += card.value }
    @total
  end

  def hit
    @hand << Card.new
  end

  def stay
    @stay = 1
  end

  def bust?
    true if self.total > 21
  end

  def turn
    loop do
      puts "Your total is #{self.total}."
      puts "You busted! Your total is #{self.total}" if self.bust?
      puts "Hit or stay?\n1: Hit\n2: Stay"
      choice = gets.chomp
      if choice == "1"
        self.hit
        self.total
      elsif choice == "2"
        puts "You stay."
        break   
      else
        puts "Please make a valid decision"
      end
    end
  end

end

class Dealer < Participant

  def turn
    if self.total < 16
      self.hit
      self.turn
    else
      self.stay
    end
  end

end


class Card
  attr_reader :value
  def initialize
    @value = (1..10).to_a.sample
    if @value == 1
      loop do
        puts "Please choose:\n1: Ace is a 1\n2: Ace is an 11"
        choice = gets.chomp
        if choice == "1"
          @value = 1
          break
        elsif choice == "2"
          @value = 11
          break
        end
      end
    end
  end
end

class Game

  def initialize
    self.start
  end

  def win?
    if @player.total <= 21 && (@player.total > @dealer.total || @dealer.bust?)
      puts "You win! Dealer had #{@dealer.total}."
      true
    elsif @dealer.total <= 21 && (@dealer.total > @player.total || @dealer.bust?)
      puts "You lose! Dealer had #{@dealer.total}." 
      true
    else
      puts "It's a draw. You had #{@player.total}. Dealer had #{@dealer.total}."
    end
  end

  def start
    @player = Participant.new
    @dealer = Dealer.new
    puts "Welcome to 21!"
    @player.hit
    @player.hit
    @dealer.hit
    @dealer.hit
    loop do
      @player.turn
      @dealer.turn
      break if @player.stay == 1 && @dealer.stay == 1 || (player.bust? || dealer.bust?)
    end
    self.win?
    puts "Play again? (y/n)"
    choice = gets.chomp.downcase
    if choice == "y"
      system "clear"
      self.start
    end
  end
  
end

game = Game.new