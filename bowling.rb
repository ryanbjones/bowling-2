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
    frames.reduce(0) do |sum, frame|
      sum + frame_score(frame)
    end
  end

  private

  def new_frame
    if frames.size == 9
      TenthFrame.new(@intermediate_rolls)
    else
      Frame.new(@intermediate_rolls)
    end
  end

  def frame_score(frame)
    frame.pins + frame_bonus(frame)
  end

  def frame_bonus(frame)
    return 0 unless frame.spare? || frame.strike?
    index = frames.index(frame)
    how_many_rolls_to_take = frame.spare? ? 1 : 2
    future_rolls = frames[(index+1)..-1].map(&:rolls).flatten
    future_rolls.take(how_many_rolls_to_take).reduce(0,:+)
  end
end
