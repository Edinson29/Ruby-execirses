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
  # Displays an error message when you enter a word
  def test_largest_palindrome_for_words
    err = assert_raises(StringError) do
      MajorPalindromo.new("paused")
    end
    assert_match 'Ese no es un numero', err.message
  end
end