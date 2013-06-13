
require 'minitest/autorun'
require_relative 'sorts'

class SortingTests < MiniTest::Test
  def test_selectionsort_small
    assert_equal [2, 3, 4, 6, 7, 7], Sorts.selectionsort(Sorts::SMALL)
  end
  def test_selectionsort_big
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
     16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
     32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
     48, 49, 50], Sorts.selectionsort(Sorts::BIG)
  end

  def test_bubblesort_small
    assert_equal [2, 3, 4, 6, 7, 7], Sorts.bubblesort(Sorts::SMALL)
  end
  def test_bubblesort_big
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
     16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
     32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
     48, 49, 50], Sorts.bubblesort(Sorts::BIG)
  end

  def test_mergesort_small_and_big
    assert_equal [0, 1, 2, 2, 3, 3, 4, 4, 5, 6, 6, 7, 7, 7, 8, 9, 10,
      11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
      27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
      43, 44, 45, 46, 47, 48, 49, 50],
      Sorts.mergesort(Sorts.selectionsort(Sorts::SMALL),
        Sorts.selectionsort(Sorts::BIG))
  end
end
