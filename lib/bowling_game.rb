# frozen_string_literal: true

# BowlingGame
class BowlingGame
  MAX_SCORE = 10

  def score(roll_one, roll_two)
    return 'first roll must be between 0 and 10' unless within_range?(roll_one, MAX_SCORE)

    max_roll_two = MAX_SCORE - roll_one
    return "second roll must be between 0 and #{max_roll_two}" unless within_range?(roll_two, max_roll_two)

    roll_one + roll_two
  end

  def within_range?(roll, max)
    roll >= 0 && roll <= max
  end
end
