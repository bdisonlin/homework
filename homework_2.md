```ruby
class Player
  def initialize(name)
    @name = name
  end 

  def welcome
    puts "hello #{@name}, welcome to the game and enjoy that ~~~ "
  end
end

# 人類玩家的類別
class Human < Player
  def get_gesture
    input = gets.chomp.upcase
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
  	input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "|--------------------------------------|"
    puts "|                                      |"
    puts "|    Welecome to paly ruby RPS game !  |"
    puts "|    Please enter your guess 'R P S'   |"
    puts "|                                      |"
    puts "|--------------------------------------|"

    puts "Please enter your name:"
    player_H = Human.new(gets.chomp.to_s)
    puts player_H.welcome
    
    begin
      begin
        puts "Please enter your guess(R/P/S):"
        player_human_input = player_H.get_gesture
      end while !["R", "P", "S"].include?(player_human_input) 
      player_C = Computer.new("computer")
      player_computer_input = player_C.get_gesture
      message = get_player_gestures(player_human_input,player_computer_input)
      show_message(player_human_input, player_computer_input, message)
      continue = continue?
      end while continue == "Y"
      goodbye
    end 
    

  def get_player_gestures(user_input, computer_input)
    #取得玩家和電腦兩個物件的 & 邏輯判斷式
    if (user_input == computer_input) 
      "It's a draw"
    elsif user_input == "R"
      if computer_input == "S" 
        "You Win"
      elsif computer_input == "P" 
        "You Lose"
      end
    elsif user_input == "P"
      if computer_input == "R" 
        "You Win"
      elsif computer_input == "S"
        "You Lose"
      end
    elsif user_input == "S"
      if computer_input == "P" 
        "You Win"
      elsif computer_input == "R" 
        "You Lose"
      end
    end
  end

  def get_input_string(input)
    gestures = {
      "R" => "Rock",
      "P" => "Paper",
      "S" => "Scissors"
    }
    gestures[input]
  end

  def continue?
    #判斷玩家是否要繼續下一輪
    begin
    puts "Play Again?: Y / N"
    continue = gets.chomp.upcase
    end while !["Y", "N"].include?(continue)
    continue
  end

  def goodbye
    puts "|----------------------------------------|"
    puts "|     Bye Bye! Thanks for playing!       |"
    puts "|        Rock Paper Scissors!!!          |"
    puts "|----------------------------------------|"
  end

  def show_message(user_input, computer_input, message)
    #印出結果
    puts "You choose #{get_input_string(user_input)}, computer chooses #{get_input_string(computer_input)}, #{message}!"
    puts "================================================="
  end
end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new
game.intro