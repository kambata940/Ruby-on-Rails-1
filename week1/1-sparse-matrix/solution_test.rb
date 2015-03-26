require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_dist
    assert_equal([0, 3, 5], [[1, 5], [4, 22], [6, 55]].distances)
  end

  def test_compress
    c = [[1, nil, nil, nil],
         [nil, 2, 5, nil],
         [6, nil, nil, 7],
         [nil, 3, nil, 4]].compress

    assert_equal([[0, 1], [1, 2], [2, 5], [0, 6],
                  nil, [1, 3], [3, 7], [3, 4]], c)
  end

  def test_first_suitable_index
    arr = [[0, 1], [1, 2], nil, [2, 5], [0, 6], nil, nil, [3, 7]]
    distances = [0, 1, 3]
    assert_equal(5, arr.first_suitable_index(distances))
  end
end
