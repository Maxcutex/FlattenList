require "test/unit/assertions"
include Test::Unit::Assertions
def recursive_flatten(array, results = [])
  array.each do |element|
    if element.class == Array
      recursive_flatten(element, results)
    else
      results << element
    end
  end
  results
end
# TEST

assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], recursive_flatten([1,2,3, [4,5], 6, [7,8], 9]))
assert_not_equal([1, 2, 3, 4, 6], recursive_flatten([1, 2, [3, [4, 5]], 6]))
assert_equal([1, 2, 3, 4], recursive_flatten([[1,2,[3]],4]))

