class Player
  attr_reader :balls,
              :pins

  def initialize()
    @balls = []
    @pins = []
  end

  def generate(num_balls)
    ball_storage = []
    num_balls.times do
      ball_storage << 'r'
      ball_storage << 'g'
      ball_storage << 'y'
      ball_storage << 'b'
    end
    random_balls = ball_storage.shuffle[0..num_balls - 1]
    random_balls.each { |ball| @balls << Ball.new(ball) }
  end
end
