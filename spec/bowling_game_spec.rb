require_relative '../lib/bowling_game'

describe BowlingGame do
  let (:bowling_game) { BowlingGame.new }

  context '#validates first roll' do
    it 'does not accept roll over 10' do
      expect(bowling_game.score(11, 0)).to eq 'first roll must be between 0 and 10'
    end

    it 'does not accept roll under 0' do
      expect(bowling_game.score(-1, 0)).to eq 'first roll must be between 0 and 10'
    end
  end

  context '#validates second roll' do
    it 'does not accept second roll that makes sum more than 10' do
      expect(bowling_game.score(1, 10)).to eq 'second roll must be between 0 and 9'
    end

    it 'does not accept second roll that makes sum less than 10' do
      expect(bowling_game.score(5, -10)).to eq 'second roll must be between 0 and 5'
    end
  end
end
