require "minitest/autorun"
require "../even_fibonacci_numbers.rb"

class FibonacciTest < Minitest::Test
  def test_fibonacci
    fibonacci_series = FibonacciSeries.new
    assert_equal 4613732, fibonacci_series.fibonacci(4_000_000)
  end
end