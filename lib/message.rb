require 'tty-font'
require 'rainbow'

module Message

  def turn_result(guess = '', results = [0,0], round = 0)
    "'#{guess.upcase}' has #{results[0]} of the correct elements with #{results[1]} in the correct positions\nYou've taken #{round} guesses"
  end

  def user_error_msgs
    {
      greater: 'You are guessing with too many balls!',
      less: 'You are not guessing with enough balls!',
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
    font.write("GOODBYE")
  end

  def game_msgs
    font = TTY::Font.new(:doom)
    {
      game_start: 'Would you like to (p)lay, read the (i)instructions, or (q)uit?',
      welcome: font.write("Welcome To") + "\n" + font.write("MASTERMIND"),
      bad_instructions: "You didn't enter a valid instruction",
      beginner_turn_prompt: game_level_helper[:beginner_intro] + game_level_helper[:beginner_color] + game_level_helper[:outro],
      intermediate_turn_prompt: game_level_helper[:intermediate_intro] + game_level_helper[:intermediate_color] + game_level_helper[:outro],
      advanced_turn_prompt: game_level_helper[:advanced_intro] + game_level_helper[:advanced_color] + game_level_helper[:outro],
      play_again: "Do you want to (p)lay again or (q)uit?",
      difficulty_levels: "What difficulty do you want to play?\n(b)eginner = 4 characters, 4 colors\n(i)ntermediate = 6 characters, 5 colors\n(a)dvanced = 8 characters, 6 colors"
    }
  end

  def game_level_helper
    {
      beginner_intro: "I have generated a beginner sequence with four elements made up of:\n",
      beginner_color: colors[:red] + ", " + colors[:green] + ", " + colors[:blue] + ", and " + colors[:yellow],
      intermediate_intro: "I have generated a intermediate sequence with six elements made up of:\n",
      intermediate_color: colors[:red] + ", " + colors[:green] + ", " + colors[:blue] + ", " + colors[:yellow] + ", and " + colors[:orange],
      advanced_intro: "I have generated a advanced sequence with eight elements made up of:\n",
      advanced_color: colors[:red] + ", " + colors[:green] + ", " + colors[:blue] + ", " + colors[:yellow] + ", " + colors[:orange] + ", and " + colors[:magenta],
      outro: ".\nUse (q)uit at any time to end the game.\nWhat's your guess?"
    }
  end

  def colors
    {
      red: Rainbow("(r)ed").red,
      green: Rainbow("(g)reen").green,
      blue: Rainbow("(b)lue").blue,
      yellow: Rainbow("(y)ellow").yellow,
      orange: Rainbow("(o)range").orange,
      magenta: Rainbow("(m)agenta").magenta
    }
  end

end
