class Message

  def welcome_prompt
    "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def turn_result
    "'RRGB' has 3 of the correct elements with 2 in the correct positions
    You've taken #{number of guesses} guesses"
  end

  def end_game
    "Congratulations! You guessed the sequence 'GRRB' in #{guesses} guesses over #{time}"
    # retry method here
  end

  def retry
    "Do you want to (p)lay again or (q)uit?"
  end

  def instructions
    #presented with a short explanation of how the game is played.
  end

  def quitting
    #goodbye msg and game exits
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

  def method_name
    "Whatever...you win I guess. Best two out of three?!"
  end

end
