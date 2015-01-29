require_relative "frame"

class Bowling
  attr_reader :score, :frames

  def initialize
    @frames = []
    @intermediate_rolls = []
  end

  def roll(pins)
    @intermediate_rolls << pins

    frame = new_frame
    if frame.complete?
      frames << frame
      @intermediate_rolls = []
    end
  end

  def score
    total = 0
    frames.each_with_index do |frame, index|
      score = frame.pins
      if frame.spare? || frame.strike?
        how_many_rolls_to_take = frame.spare? ? 1 : 2
        future_rolls = frames[(index+1)..-1].map(&:rolls).flatten
        score += future_rolls.take(how_many_rolls_to_take).reduce(0,:+)
      end

      total += score
    end
    total
  end

  private

  def new_frame
    if frames.size == 9
      TenthFrame.new(@intermediate_rolls)
    else
      Frame.new(@intermediate_rolls)
    end
  end
end
