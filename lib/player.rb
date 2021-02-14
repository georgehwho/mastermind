class Player
  EASY = %w[r g y b]
  INTERMEDIATE = %w[r g y b o]
  HARD = %w[r g y b o m]
  attr_reader :balls,
              :pins,
              :ball_storage,
              :difficulty

  def initialize()
    @balls = []
    @pins = []
  end

  def generate(num_balls = 4)
    @balls = []
    @pins = []
    ball_generator(num_balls)
    random_balls = ball_storage.shuffle[0..num_balls - 1]
    random_balls.each { |ball| @balls << Ball.new(ball) }
  end

  def ball_generator(num_balls)
    difficulty_setter(num_balls)
    @ball_storage = []
    num_balls.times { @ball_storage << difficulty }
    @ball_storage.flatten!
  end

  def difficulty_setter(total_num_balls)
    @difficulty = EASY if total_num_balls == 4
    @difficulty = INTERMEDIATE if total_num_balls == 6
    @difficulty = HARD if total_num_balls == 8
  end

  def set_answer(player_response)
    @balls = []
    @pins = []
    difficulty_setter(player_response.size)
    player_response.chars.each { |color| @balls << Ball.new(color) }
  end

  def check_answer(answer)
    ball_array = answer.chars
    check_correct_pins(ball_array)
    check_pin_position(ball_array)
  end

  def check_correct_pins(balls)
    ball_holder = list_balls
    balls.each_with_index do |ball, index|
      if ball_holder.include?(ball)
        @pins << Pin.new()
        @pins.find { |pin| pin.correct == false }.only_correct
        ball_holder.delete_at(ball_holder.index(ball))
      end
    end
  end

  def check_pin_position(balls)
    list_balls.each_with_index do |ball, index|
      if balls[index] == ball
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
