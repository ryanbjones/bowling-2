class Bowling
  attr_reader :score
  def initialize
    @frames = Array.new(10) {Frame.new}
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
    @frames[prior_frame].add_bonus(pins) if @frames[prior_frame].needs_bonus?
  end

  def prior_frame
    @current_frame > 0 ? @current_frame - 1 : 9
  end

  def score
    @frames.map(&:score).reduce(:+)
  end

end

class Frame
  def initialize
    @rolls = []
    @score = 0
    @bonus = []
  end

  def add_roll(pins)
    @score += pins
    @rolls.push(pins)
  end
    @score += pins
  end

end