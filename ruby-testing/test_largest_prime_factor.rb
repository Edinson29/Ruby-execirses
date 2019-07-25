require "minitest/autorun"
require "../largest_prime_factor.rb"

class LarggestPrimeFactorTest < Minitest::Test

  # Checking the functionality of the exercise

  def test_largest_prime_factor_for_funcionality
    largest_pf = LargestPrimeFactor.new
    assert largest_pf.factor
  end

  # You must return 6857 when you place the number 600851475143

  def test_largest_prime_factor_for_600851475143
    largest_pf = LargestPrimeFactor.new
    assert_equal 6857, largest_pf.factor(600851475143)
  end

  # Here we verify that although the number is a string can work the
  # exercise and that when you send a string without sense returns a null value.

  def test_largest_prime_factor_for_strings
    largest_pf = LargestPrimeFactor.new
    assert_equal 6857, largest_pf.factor("600851475143")
    assert_equal 0, largest_pf.factor("koombea")
  end
end