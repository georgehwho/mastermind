require 'tty-font'

module Message

  def turn_result(guess = '', results = [0,0], round = 0)
    "'#{guess.upcase}' has #{results[0]} of the correct elements with #{results[1]} in the correct positions\nYou've taken #{round} guesses"
  end

  def user_error_msgs
    {
      greater4: 'You are guessing with too many balls!',
      less4: 'You are not guessing with enough balls!',
      bad_inputs: "You didn't guess with the correct colors!"
    }
  end

  # Turn Prompts above ______________________________________Game prompts below

  def end_game(input = '', round = 0, start_time, end_time)
    "Congratulations! You guessed the sequence '#{input.upcase}' in #{round} guesses over #{((end_time-start_time) / 60).round} minutes, #{((end_time-start_time) % 60).round} seconds."
  end

  def retry
    "Do you want to (p)lay again or (q)uit?"
  end

  def instructions_prompt
    #presented with a short explanation of how the game is played.
    "Here is how to play.\nPress any key to go back or (q) to quit"
  end

  def quitting
    font = TTY::Font.new(:doom)
    puts font.write("GOODBYE")
  end

  def game_msgs
    font = TTY::Font.new(:doom)
    {
      game_start: 'Would you like to (p)lay, read the (i)instructions, or (q)uit?',
      welcome: font.write("Welcome To") + "\n" + font.write("MASTERMIND"),
      bad_instructions: "you didn't enter a valid instruction",
      turn_prompt: "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess?",
      play_again: "Do you want to (p)lay again or (q)uit?"
    }
  end

end
