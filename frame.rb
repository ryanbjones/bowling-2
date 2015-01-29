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