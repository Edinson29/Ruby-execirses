require "minitest/autorun"
require "../largest_palindrome_product.rb"

class LargestPalindromeTest < Minitest::Test

  # Here we verify that the method works perfectly

  def test_largest_palindrome_for_funcionality
    l_palindrome_p = MajorPalindromo.new(0)
    assert l_palindrome_p.palindromo
  end

  # When the palindromo is 3 it must throw the number 906609

  def test_largest_palindrome_for_3
    l_palindrome_p = MajorPalindromo.new(3)
    assert_equal 906609, l_palindrome_p.palindromo
  end

  # Run the program even if the number is as string

  def test_largest_palindrome_for_string
    l_palindrome_p = MajorPalindromo.new("3")
    assert_equal 906609, l_palindrome_p.palindromo
  end

  # Casts 0 when words are written
  
  def test_largest_palindrome_for_words
    l_palindrome_p = MajorPalindromo.new("paused")
    assert_equal 0, l_palindrome_p.palindromo
  end
end