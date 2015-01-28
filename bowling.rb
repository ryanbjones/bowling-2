class Bowling
  attr_reader :score
  def initialize
    @frames = Array.new(10) {Frame.new}
    @current_frame = 0
  end

  def roll(pins)
    @score += pins
  end

end