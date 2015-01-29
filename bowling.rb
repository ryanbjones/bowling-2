require_relative "frame"
require 'debugger'

class Bowling
  attr_reader :score
  def initialize
    @frames = Array.new(9) {Frame.new}
    @frames.push(TenthFrame.new)
    @current_frame = 0
  end

  def roll(pins)
    # add pins to current frame if incomplete
    if @frames[@current_frame].incomplete?
      @frames[@current_frame].add_roll(pins)
    #move to next frame
    else
      @current_frame += 1
      @frames[@current_frame].add_roll(pins)
    end
    #add bonus if necessary
    calculate_bonus(pins)
  end

  def prior_frame
    @current_frame > 0 ? @current_frame - 1 : 9
  end

  def score
    @frames.map(&:score).reduce(:+)
  end

  def calculate_bonus(pins)
    @frames[prior_frame].add_bonus(pins) if @frames[prior_frame].needs_bonus?
    @frames[prior_frame - 1].add_bonus(pins) if @current_frame > 1 && @frames[prior_frame - 1].needs_bonus?
  end

end

