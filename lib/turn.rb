class Turn
  attr_reader :player,
              :round

  def initialize(player, round)
    @player = player
    @round = [0..10]
  end

  def player_won_round
    if @player.place_pins.results == [0, 1]
      p "Look at you go!?"
      p "-".times 10
    end
    if @player.place_pins.results == [0, 2]
      p "You heating up but you won't do it again."
      p "-".times 10
    end
    if @player.place_pins.results == [0, 3]
      p "I let you have that one!"
      p "-".times 10
    end
    if @player.place_pins.results == [0, 4]
      p "Whatever...you win I guess. Best two out of three?!"
    end
  end

  def player_lost_round
    if @round.empty? && @player.place_pins.results.sum > 4
      "YOU LOSE!"
    end
  end
  # Subtract round_count until empty = end of the turn, announces winner/loser,
  # and resets to new round.
  def round_over
      if @round.empty?
      end
  end

end
