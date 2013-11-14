class Game

  def guess_a_numb_without_args()
    number = rand(1..100)

    while true
      puts "Guess a number between 1-100. Type 'q' to quit"
      input = gets.chomp
      if input.to_i == number
        puts "Congrats, you won! The number was #{number}."
        break
      elsif input == "q"
        break
      else
        puts "Nope, that wasn't it. Guess again"
        puts "Pssst--its between #{number - 7} and #{number + 1}"
      end
    end
  end

  def guess_a_numb(guess)
    @number = rand(1..100)

    if guess == number
        puts "Congrats, you won! The number was #{number}."
      else
        puts "Sorry, the number was #{number}"
      end
    end

end

guess_game = Game.new

guess_game.guess_a_numb_without_args

# guess_game_2 = Game.new

# puts "Guess a number between 1-100. Type 'q' to quit"
# input = gets.chomp
# game_response = guess_game_2.guess_a_numb(input.to_i)









