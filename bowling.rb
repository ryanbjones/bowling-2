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
    #add bonus if necessary
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
  attr_accessor :score

  def initialize
    @rolls = []
    @score = 0
    @bonus = []
  end

  def add_roll(pins)
    @score += pins
    @rolls.push(pins)
  end

  def needs_bonus?
    @bonus.length < 1 && spare? || @bonus.length < 2 && strike?
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    @rolls.reduce(:+) == 10 && @rolls.length == 2
  end

  def add_bonus(pins)
    @bonus.push(pins)
    @score += pins
  end

  def complete?
    @rolls.length == 2 || @rolls.first == 10
  end

  def incomplete?
    !complete?
  end
end