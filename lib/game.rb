require_relative 'message'
require 'benchmark'

class Game
  include Message
  attr_reader :turn, :round, :time1, :time2

  def initialize
    @turn = Turn.new
    @round = 0
  end

  def start
    puts game_msgs[:welcome]
    puts
    first_prompt
  end

  def first_prompt
    puts game_msgs[:game_start]
    print '> '
    input = gets.chomp.downcase
    if input == 'p'
      turn.start_phase
      puts game_msgs[:turn_prompt]
      @time1 = Time.now
      playing
    elsif input == 'i'
      instructions
    elsif input == 'q'
      quitting
    else
      puts user_error_msgs[:bad_instructions]
      first_prompt
    end
  end

  def instructions
    puts instructions_prompt
    print '> '
    instruction_input = gets.chomp.downcase
    if instruction_input == 'q'
      quitting
    else
      first_prompt
    end
  end

  def playing
    print '> '
    input = gets.chomp.downcase
    if input == 'c'
      puts turn.cheat
      playing
    elsif input == 'q'
      quitting
    else
      @round += 1
      puts turn.guess(input, round)

      if turn.pin_results == [4,4]
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
    input = gets.chomp.downcase
    if input == 'p'
      puts
      turn.start_phase
      @round = 0
      @time1 = Time.now
      puts game_msgs[:turn_prompt]
      playing
    elsif input == 'q'
      puts
      quitting
    else
      again
    end
  end
end
