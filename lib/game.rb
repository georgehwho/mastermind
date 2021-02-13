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
    @time1 = Time.new
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
      playing
    elsif input == 'i'
      puts instructions
      print '> '
      instruction_input = gets.chomp.downcase
      if instruction_input == 'q'
        puts quitting
      else
        first_prompt
      end
    elsif input == 'q'
      puts quitting
    else
      puts user_error_msgs[:bad_instructions]
      first_prompt
    end
  end

  def playing
    print '> '
    input = gets.chomp
    if input.downcase == 'c'
      puts turn.cheat
      playing
    else
      @round += 1
      puts turn.guess(input, round)

      if turn.pin_results == [4,4]
        @time2 = Time.new 
        puts end_game(input, round, time2-time1)
      else
        turn.clear_pins
        playing
      end
    end
  end
end
