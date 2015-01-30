class Frame
  attr_accessor :rolls

  def initialize(rolls)
    @rolls = rolls
  end

  def pins
    rolls.reduce(0,:+)
  end

  def strike?
    rolls.first == 10
  end

  def spare?
    !strike? && rolls.reduce(:+) == 10
  end

  def complete?
    strike? || rolls.length == 2
  end
end

class TenthFrame < Frame
  def complete?
    !incomplete?
  end

  def incomplete?
    @rolls.length == 1 || ((strike? || spare?) && @rolls.length < 3)
  end

  def spare?
    @rolls.length > 1 && @rolls[0] + @rolls[1] == 10
  end
end
