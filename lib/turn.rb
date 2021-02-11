class Turn
  attr_reader :messages,
              :player,

  def initialize(player)
    @player = player
  end

  def user_guess
    input = gets.chomp.downcase
    return nil if input.length > 4
    input
  end

  def start_phase
    player.generate(4)
  end

  # guess
  #
  # comparison of guess to generated code
  #
  # response to that guess via pins

  # Need instance of player in turn because turn needs to use methods in player
end
