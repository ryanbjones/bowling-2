class Bowling
  attr_reader :score
  def initialize
    @frames = Array.new(10) {Frame.new}
    @current_frame = 0
  end

  def roll(pins)
class Frame
  def initialize
    @rolls = []
    @score = 0
    @bonus = []
  end
    @score += pins
  end

end