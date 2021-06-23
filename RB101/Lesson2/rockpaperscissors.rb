#Rock Paper Scissors game

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
  
  loop do
    computer_choice = ['r', 'p', 's'].sample
    if computer_choice == 'r' && player_choice == 'r'
      puts "=>It's a tie! both you and the computer chose rock!"
      break
    elsif computer_choice == 'r' && player_choice == 'p'
      puts "=>You win! The computer chose rock!"
      break
    elsif computer_choice == 'r' && player_choice == 's'
      puts "=>You lose. Unfortunately the computer chose rock."
      break
    elsif computer_choice == 'p' && player_choice == 'p'
      puts "=>It's a tie! both you and the computer chose paper!"
      break
    elsif computer_choice == 'p' && player_choice == 's'
      puts "=>You won! The computer chose paper!"
      break
    elsif computer_choice == 'p' && player_choice == 'r'
      puts "=>You lose. Unfortunately the computer chose paper."
      break
    elsif computer_choice == 's' && player_choice == 's'
      puts "=>It's a tie! both you and the computer chose scissors!"
      break
    elsif computer_choice == 's' && player_choice == 'p'
      puts "=>You lose. Unfortunately the computer chose scissors."
      break
    elsif computer_choice == 's' && player_choice == 'r'
      puts "=>You win! The computer chose scissors!"
      break
    end
  end
  puts '=>Would you like to play again? (y/n)'
  decision = gets.chomp.downcase
  break if decision != 'y'
end
puts '=>Goodbye!'