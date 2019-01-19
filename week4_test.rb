require 'test/unit'
require './week4/recursion_practice/array_max.rb'
require './week4/recursion_practice/contains_char.rb'
require './week4/recursion_practice/count_array.rb'
require './week4/recursion_practice/factorial.rb'
require './week4/recursion_practice/sum_of_digits.rb'

class Week4Test < Test::Unit::TestCase
  def test_arr_max1
    assert_equal(10, array_max([10]))
  end

  def test_arr_max2
    assert_equal(20, array_max([5, 17, 20, 13, 11, 9]))
  end

  def test_arr_max3
    assert_equal(100, array_max(Array(1..100)))
  end

  def test_arr_max4
    assert_equal(-1, array_max([-1] * 10))
  end

  def test_contains_char1
    assert_true(contains_char('',''))
  end

  def test_contains_char2
    assert_false(contains_char('','a'))
  end

  def test_contains_char3
    assert_true(contains_char('sterio', 'o'))
  end

  def test_contains_char4
    assert_true(contains_char('paiyuyiap', 'u'))
  end

  def test_contains_char5
    assert_false(contains_char('mitochondria', ' '))
  end

  def test_count_arr1
    assert_equal(1, count_array([[[[[[[[[[[[1]]]]]]]]]]]]))
  end

  def test_count_arr2
    assert_equal(6, count_array([2, [1, 3, [6]], [[4]], [[5]]]))
  end

  def test_count_arr3
    assert_equal(5, count_array([1, [2, [3, [4, [5]]]]]))
  end

  def test_count_arr4
    assert_equal(0, count_array([[[[[[[[]]]]]]]]))
  end

  def test_factorial1
    assert_equal(0, factorial(0))
  end

  def test_factorial2
    assert_equal(24, factorial(4))
  end

  def test_factorial3
    assert_equal(120, factorial(5))
  end

  def test_factorial4
    assert_equal(3628800, factorial(10))
  end

  def test_sum_of_digits1
    assert_equal(1, sum_of_digits(1))
  end

  def test_sum_of_digits2
    assert_equal(3, sum_of_digits(10000000010001))
  end

  def test_sum_of_digits3
    assert_equal(10, sum_of_digits(4120003))
  end

  def test_sum_of_digits4
    assert_equal(45, sum_of_digits(123456789))
  end
end