class Pin
  attr_reader :correct,
              :position

  def initialize()
    @correct = false
    @position = false
  end

  def only_correct
    @correct = true
  end

  def both_correct
    @correct = true
    @position = true
  end
end
