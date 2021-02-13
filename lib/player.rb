class Player
  attr_reader :balls,
              :pins

  def initialize()
    @balls = []
    @pins = []
  end
# Method starts with empty arrays because we want to start fresh in between trurns.
# Lines 21 - 25 > We are taking the argument "num_balls" multiplying it by each color
# and adding it into our holder, ball_storage. Lines 24 & 25 > We are using shuffle method
# to "randomize" the balls and then indexing based on our argument but then subtracting one
# to account for 0 equaling the 1st ball. Then we are iterating over random_balls, creating
# a ball object with it's color argument and adding it to our @balls array.

  def generate(num_balls = 4)
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

# Method starts with empty arrays because we don't want to add to our answer by accident.
# We then turn the player_response into an array that we iterate over,convert to colored
# ball objects, and add our into the @balls array. Basically restructing the argument/answer # and adding into new array.

  def set_answer(player_response)
    @balls = []
    @pins = []
    player_response.chars.each { |color| @balls << Ball.new(color) }
  end

  # Start by setting an index to 0. Take anser and convert from str to array.
  # Basically checks ball at each index to confirm it's right. If so it then deletes
  # that ball and moves on to the next one until it's done checking the array.
  # Then we can use our counter quantity to add our pins into the pin array and
  # convert those pins to true for correct.

  def check_answer(answer)
    counter = 0
    ball_holder = list_balls
    ball_array = answer.chars

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
      # handles whether balls are in position
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
    results = [0, 0]
    @pins.each do |pin|
      if pin.correct == true
        results[0] += 1
      end
      if pin.position == true
        results[1] += 1
      end
    end
    results
  end

  def reset_pins
    @pins = []
  end
end
