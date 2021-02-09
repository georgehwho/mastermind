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
    counter = 0
    ball_holder = list_balls
    ball_array = answer.chars
    unique_balls = ball_array.uniq

    #adds in and sets to correct
    ball_array.each_with_index do |ball, index|
      # handles whether balls are correct
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
      # handles whetehr balls are in position
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

  # returns an array of the results with index 0 being only correct and index 1 meaning both are correct
  # no argument -> array of results
  def place_pins
    return nil if @pins.empty?

    results = [0, 0]
    @pins.each do |pin|
      if pin.correct == true
        results[0] += 1
      end
      if pin.position == true
        results[1] += 1
      end
    end
    @pins = 0
    results
  end
end
