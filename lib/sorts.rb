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
