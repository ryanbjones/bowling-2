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

  it 'scores a spare' do
    game.roll(6)
    game.roll(4)
    game.roll(2)
    17.times{ game.roll(0) }
    expect(game.score).to eq(14)
  end

  it 'scores a strike' do
    game.roll(10)
    game.roll(5)
    17.times {game.roll(0)}
    expect(game.score).to eq(20)
  end

end