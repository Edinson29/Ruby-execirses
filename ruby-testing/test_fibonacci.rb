require "minitest/autorun"
require "../even_fibonacci_numbers.rb"

class FibonacciTest < Minitest::Test
  # when the parameter is 4_000_000 it should return the expected value of 4613732
  def test_fibonacci_for_4_000_000
    fibonacci_series = FibonacciSeries.new
    assert_equal 4613732, fibonacci_series.fibonacci(4_000_000)
    assert true, fibonacci_series.fibonacci(0)
    assert_equal "Error", fibonacci_series.fibonacci("hola")
    assert fibonacci_series.fibonacci
  end
end