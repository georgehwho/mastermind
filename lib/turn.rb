class Turn
  attr_reader :generated_balls,
              :messages

  def initialize(messages)
    @generated_balls = ['r', 'y', 'g', 'b'].shuffle
    @messages = messages
  end

  def user_guess
    gets.chomp.downcase
  end

  # guess
  #
  # comparison of guess to generated code
  #
  # response to that guess via pins
end
