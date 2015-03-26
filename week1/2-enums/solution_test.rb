require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_the_truth
  	Enums.map(:direction, to: [:east, :west, :north, :south])
    assert_equal 4, Traveling.new.move_towards(:west)
  end
end
