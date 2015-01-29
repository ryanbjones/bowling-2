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

  it 'scores three consecutive strikes' do
    3.times {game.roll(10) }
    14.times {game.roll(0)}
    expect(game.score).to eq(60)
  end

  it 'scores a 10th frame properly' do
    14.times {game.roll(0)}
    5.times {game.roll(10)}
    expect(game.score).to eq(90)
  end

  it 'scores a perfect game properly' do
    12.times {game.roll(10)}
    expect(game.score).to eq(300)
  end
end