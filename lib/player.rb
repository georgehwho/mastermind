class Player
  attr_reader :balls,
              :pins

  def initialize()
    @balls = []
    @pins = []
  end

  def generate(num_balls)
    @balls = []
    @pins = []
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

  def set_answer(player_response)
    @balls = []
    @pins = []
    player_response.chars.each { |color| @balls << Ball.new(color) }
  end

  # string -> return pins that are correct or in position
  def check_answer(answer)
    ball_array = answer.chars
    puts ball_array
    unique_balls = ball_array.uniq
    puts 'start of uniq'
    puts unique_balls

    #adds in and sets to correct
    @balls.each_with_index do |ball, index|
      if unique_balls.include?(ball.color)
        @pins << Pin.new()
        @pins.find { |pin| pin.correct == false }.only_correct
      end
      if ball_array[index] == ball.color
        @pins.find { |pin| pin.position == false }.both_correct
      end
    end
  end
end
