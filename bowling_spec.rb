require_relative 'bowling'

describe Bowling do
  let(:game) {Bowling.new()}

  it 'scores a game of zero' do
    20.times { game.roll(0) }
    expect(game.score).to eq(0)
  end

  it 'scores a game of ones' do
    20.times { game.roll(1)}
    expect(game.score).to eq(20)
  end

end