require 'minitest/autorun'
require '../factorial_of_a_number.rb'

class FactorialTest < Minitest::Test
  
  # Here we verify that the method works perfectly
  def test_factorial_for_funcionality
    factorial = Factorial.new
    assert factorial.calculate
  end

  # When the factorial is 5 it must throw the number 120
  def test_factorial_for_5
    factorial = Factorial.new
    assert_equal 120, factorial.calculate(5)
  end

  # Here we verify that the algorithm also works with numbers that are like strings
  def test_factorial_for_strings_number
    factorial = Factorial.new
    assert_equal 120, factorial.calculate('5')
  end

  # We verify that with the negative numbers the factorial is also fulfilled.
  def test_factorial_for_negative_numbers
    factorial = Factorial.new
    assert_equal 120, factorial.calculate(-5)
  end
  # I included an error for when typing words
  def test_factorial_for_words
    err = assert_raises(StringError) do
      factorial = Factorial.new
      factorial.calculate('words')
    end
    assert_match 'That is not a number', err.message
  end
end