# Rock Paper Scissors game

def win?(first, second)
  (first == 'rock' && second == 'scissors' ||
  first == 'scissors' && second == 'paper' ||
  first == 'paper' && second == 'rock')
end

loop do 
  player_choice = ''
  loop do
    puts "=> Welcome to Rock Paper Scissors.\n=>Please make a choice: rock, paper, or scissors"
    player_choice << gets.chomp.downcase
    case player_choice
    when 'rock'
      puts '=>You chose rock.'
      break
    when 'paper'
      puts '=>You chose paper.'
      break
    when 'scissors'
      puts '=>You chose scissors.'
      break
    else
      puts '=>Please input a valid choice.'
    end
  end

  computer_choice = %w[rock paper scissors].sample

  if win?(player_choice, computer_choice)
    puts "=>You won! Computer chose #{computer_choice}. "
  elsif win?(computer_choice, player_choice)
    puts "=>You lost! Computer chose #{computer_choice}."
  else
    puts "=>It's a tie! Computer chose #{computer_choice}."
  end

  puts '=>Would you like to play again? (y/n)'
  decision = gets.chomp.downcase
  break if decision != 'y'
end
puts '=>Goodbye!'
