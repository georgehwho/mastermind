class Player
  attr_reader :balls,
              :pins

  def initialize()
    @balls = []
    @pins = []
  end

  def generate(num_balls = 4)
    @balls = []
    @pins = []
    ball_storage = []
    num_balls.times do
      ball_storage << 'r' << 'g' << 'y' << 'b'
    end
    random_balls = ball_storage.shuffle[0..num_balls - 1]
    random_balls.each { |ball| @balls << Ball.new(ball) }
  end

  def set_answer(player_response)
    @balls = []
    @pins = []
    player_response.chars.each { |color| @balls << Ball.new(color) }
  end

  def check_answer(answer)
    counter = 0
    ball_holder = list_balls
    ball_array = answer.chars

    ball_array.each_with_index do |ball, index|
      if ball_holder.include?(ball)
        counter += 1
        ball_holder.delete_at(ball_holder.index(ball))
      end
    end

    counter.times do
      @pins << Pin.new()
      @pins.find { |pin| pin.correct == false }.only_correct
    end

    list_balls.each_with_index do |ball, index|
      if ball_array[index] == ball
        @pins.find { |pin| pin.position == false }.both_correct
      end
    end
  end

  def list_balls
    list_of_balls = []
    @balls.each { |ball| list_of_balls << ball.color }
    list_of_balls
  end

  def place_pins
    results = [0, 0]
    @pins.each do |pin|
      results[0] += 1 if pin.correct == true
      results[1] += 1 if pin.position == true
    end
    results
  end

  def reset_pins
    @pins = []
  end
end
