require_relative 'message'

class Game
  include Message

  attr_reader :turn,
              :round,
              :time1,
              :time2,
              :difficulty

  def initialize
    @turn = Turn.new
  end

  def start
    puts game_msgs[:welcome]
    puts
    first_prompt
  end

  def first_prompt
    puts game_msgs[:game_start]
    print '> '
    input = sanitized_gets
    if input == 'p'
      start_prompt
    elsif input == 'i'
      instructions
    elsif input == 'q'
      puts quitting
    else
      puts user_error_msgs[:bad_instructions]
      first_prompt
    end
  end

  def start_prompt
    pick_difficulty
    @round = 0
    @time1 = Time.now
    playing
  end

  def pick_difficulty
    puts game_msgs[:difficulty_levels]
    print '> '
    input = sanitized_gets
    if input == 'b'
      @difficulty = 4
      turn.start_phase(4)
      puts game_msgs[:beginner_game_prompt]
    elsif input == 'i'
      @difficulty = 6
      turn.start_phase(6)
      puts game_msgs[:intermediate_game_prompt]
    elsif input == 'a'
      @difficulty = 8
      turn.start_phase(8)
      puts game_msgs[:advanced_game_prompt]
    else
      puts game_msgs[:bad_instructions]
      puts
      pick_difficulty
    end
  end

  def instructions
    puts instructions_prompt
    print '> '
    instruction_input = sanitized_gets
    if instruction_input == 'q'
      puts quitting
    else
      first_prompt
    end
  end

  def playing
    print '> '
    input = sanitized_gets
    if input == 'c'
      puts turn.cheat
      playing
    elsif input == 'q'
      puts quitting
    else
      @round += 1
      puts turn.guess(input, round, difficulty)

      if turn.win?(difficulty)
        @time2 = Time.now
        puts
        puts end_game(input, round, time1, time2)
        puts
        again
      else
        turn.clear_pins
        playing
      end
    end
  end

  def again
    puts game_msgs[:play_again]
    print '> '
    input = sanitized_gets
    if input == 'p'
      puts
      start_prompt
    elsif input == 'q'
      puts
      puts quitting
    else
      puts game_msgs[:bad_instructions]
      puts
      again
    end
  end

  def sanitized_gets
    gets.chomp.downcase.delete(" ")
  end
end
