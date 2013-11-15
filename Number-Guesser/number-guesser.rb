class Game

  def guess_a_numb_without_args()
    number = rand(1..100)
    # puts number
    i = 0
    while true
      puts "___________________________________________"
      puts "Number of turns: " + "(#{i+1}) " + "*"*(i+1) 
      i += 1
      puts "Guess a number between 1-100. Press 'q' to quit"
      input = gets.chomp
      if input.to_i == number
        puts "Congrats, you won! The number was #{number}. To play\nagain, type 'a' or type 'q' to quit"
        inp = gets.chomp
        if inp == "a"
          guess_a_numb_without_args()
        else
          break
        end
      elsif input == "q"
        break
      else
        puts "Nope, that wasn't it. Guess again"
        if (number-20..number+20).to_a.include? input.to_i
          puts "Hint: You're warm"
          if (number-10..number+10).to_a.include? input.to_i
            puts "Hint: You're super warm!"
            if (number-5..number+5).to_a.include? input.to_i
              puts "Hint: You're HOT! Almost there..."
            end
          end
        else
          puts "Hint: You're cold"
        end

        if i == 6
          puts "Ok, jesus, you suck at this. The number is between #{number - 10} and #{number + 7}"
        end

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









