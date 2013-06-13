#
#
#

require 'minitest/autorun'

module Sorts

  SMALL = [2, 4, 3, 6, 7, 7]
  BIG   = [22, 31, 28, 49, 0, 13, 47, 30, 44, 46, 29,
            40, 48, 36, 18, 37, 32, 34, 25, 14, 21, 15,
            9, 6, 50, 33, 2, 27, 35, 4, 43, 45, 1, 20,
            24, 16, 26, 7, 10, 12, 17, 3, 19, 8, 41, 5,
            42, 11, 38, 23, 39]

  def self.selectionsort(unsorted)
    # non-recursive selectionsort
    sorted = []

    while unsorted.length > 0 do
      tmpsort = []
      lowest = unsorted[0]

      unsorted.each do |item|
        if item < lowest
          tmpsort.unshift(item)
          lowest = item
        else
          tmpsort.push(item)
        end
      end

      sorted << tmpsort[0]
      unsorted = tmpsort[1..-1]
      #unsorted = tmpsort[(1..-1)]

    end
    return sorted
  end

  def self.bubblesort(unsorted)
    unsorted.each_cons(2) do |x,y|
      if x>y
        x,y = y,x
        #retry
      end
    end
    return unsorted
  end

  def self.mergesort(unsortedA, unsortedB)
    # merges two pre-sorted arrays
    injection_array, base_array = [unsortedA, unsortedB].sort_by(&:length)
    sorted = []
    i = 0

    base_array.each do |item|
      injectee = injection_array[i]

      while (injectee != nil) && (injectee < item) do
        sorted.push(injectee)
        injectee = injection_array[i+=1]
      end

      if (injectee != nil) && (injectee == item)
        sorted.push(injectee, item)
        i += 1
      else
        sorted.push(item)
      end
    end
    return sorted
  end
end


######################################################

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
