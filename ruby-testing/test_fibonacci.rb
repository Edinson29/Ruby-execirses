require "minitest/autorun"
require "../even_fibonacci_numbers.rb"

class FibonacciTest < Minitest::Test

  # This test lets us know if the code works or not

  def test_fibonacci_for_funcionality
    fibonacci_series = FibonacciSeries.new
    assert fibonacci_series.fibonacci
  end

  # when the parameter is 4_000_000 it should return the expected value of 4613732

  def test_fibonacci_for_4_000_000
    fibonacci_series = FibonacciSeries.new
    assert_equal 4613732, fibonacci_series.fibonacci(4_000_000)
  end

  # This method must return 0 because when the parameter is 0 the method must not throw any value
  
  def test_fibonacci_for_0
    fibonacci_series = FibonacciSeries.new
    assert_equal 0, fibonacci_series.fibonacci(0)
  end

  # This test must first return the result of 3382 because although it is a string that receives
  # is a number and must perform the operation and the second must return 0 because the string
  # does not carry within a number and the code should not return any value.
  
  def test_fibonacci_for_strings
    fibonacci_series = FibonacciSeries.new
    assert_equal 3382, fibonacci_series.fibonacci("4000")
    assert_equal 0, fibonacci_series.fibonacci("hola")
  end
end