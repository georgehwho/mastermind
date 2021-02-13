module Message

  def turn_result(guess = '', results = [0,0], round = 0)
    "#{guess.upcase} has #{results[0]} of the correct elements with #{results[1]} in the correct positions \n You've taken #{round} guesses"
  end

  def tier_1
    "Look at you go"
  end

  def tier_2
    "You heating up but you won't do it again."
  end

  def tier_3
    "I let you have that one!"
  end

  def tier_4
    "Whatever...you win I guess. Best two out of three?!"
  end

  def user_error_msgs
    {
      greater4: 'too many balls!!!',
      less4: 'too little balls!!!',
      general: 'you messed up in general.',
      bad_inputs: "you didn't input the correct colors",
      bad_instructions: "you didn't enter a valid instruction"
    }
  end
  # Turn Prompts above ______________________________________Game prompts below
  def end_game
    "Congratulations! You guessed the sequence #{player answer } in #{guesses} guesses over #{time}"
    # retry method here
  end

  def retry
    "Do you want to (p)lay again or (q)uit?"
  end

  def instructions
    #presented with a short explanation of how the game is played.
    'here is how to play. Press any key to go back and q to quit'
  end

  def quitting
    'goodbye msg and game exits'
  end

  def game_msgs
    {
      game_start: 'Would you like to (p)lay, read the (i)instructions, or (q)uit?',
      welcome: 'Welcome to MASTERMIND!',
      turn_prompt: "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?",
    }
  end

end
