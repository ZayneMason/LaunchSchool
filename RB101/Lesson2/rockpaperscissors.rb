# Rock Paper Scissors game

def win?(first, second)
  (first == 'r' && second == 'scissors' ||
  first == 's' && second == 'paper' ||
  first == 'p' && second == 'rock')
end

loop do 
  player_choice = ''
  loop do
    puts "=> Welcome to Rock Paper Scissors.\n=>Please make a choice:\n---'R' for rock \n---'P' for paper \n---'S' for scissors."
    player_choice << gets.chomp.downcase
    case player_choice
    when 'r'
      puts '=>You chose rock.'
      break
    when 'p' 
      puts '=>You chose paper.'
      break
    when 's'
      puts '=>You chose scissors.'
      break
    else
      puts '=>Please input a valid choice.'
    end
  end

  computer_choice = %w[rock paper scissors].sample

  if win?(player_choice, computer_choice)
    puts "=>You won! Computer chose #{computer_choice}. "
  else
    puts "=>You lost! Computer chose #{computer_choice}."
  end

  puts '=>Would you like to play again? (y/n)'
  decision = gets.chomp.downcase
  break if decision != 'y'
end
puts '=>Goodbye!'
