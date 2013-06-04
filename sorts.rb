#
#
#

module Sorts

  SMALL = [2, 4, 3, 6, 7, 7]
  BIG   = [22, 31, 28, 49, 0, 13, 47, 30, 44, 46, 29,
            40, 48, 36, 18, 37, 32, 34, 25, 14, 21, 15,
            9, 6, 50, 33, 2, 27, 35, 4, 43, 45, 1, 20,
            24, 16, 26, 7, 10, 12, 17, 3, 19, 8, 41, 5,
            42, 11, 38, 23, 39]

  def self.selectionsort(unsorted)
    sorted = []
    tmpsort = []

    while unsorted.length > 0 do
      tmpsort = []
      lowest = unsorted[0]

      unsorted.each do |item|
        if item < lowest
          tmpsort.unshift(item)
        else
          tmpsort.push(item)
        end
      end
      # slower? w/ unix's 'time' call, apparently so, but erratic
      sorted << tmpsort[0]
      unsorted = tmpsort[(1..-1)]
      # sorted.push(tmpsort.shift)
      # unsorted = tmpsort
    end
    sorted # return sorted array
  end

  def self.bubblesort(unsorted)
    sorted = []
    tmpsort = []

    while unsorted.length > 0 do
      tmpsort = []

    end

  end
end

# p selectionsort([2, 4, 3, 6, 7, 7])
