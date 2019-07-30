require 'minitest/autorun'
require '../palindromo.rb'

class PalindromoTest < Minitest::Test
  
  # Here we verify that it works perfectly
  def test_palindromo_for_funcionality
    letter = LettersPalindromo.new('oso')
    assert letter.palindromo?
  end

  # When we give him a palindrom he must throw true
  def test_palindromo_for_a_palindromo
    letter = LettersPalindromo.new('oso')
    assert true, letter.palindromo?
  end

  # When we give him a word that's not palindrom he must throw false.
  def test_palindromo_for_a_not_palindromo
    letter = LettersPalindromo.new('hoja')
    assert_equal false, letter.palindromo?
  end

  # Throw an error in case you want to mix words with numbers in a string
  def test_factorial_for_words
    err = assert_raises(TypeError) do
      letter = LettersPalindromo.new('oc0')
      letter.palindromo?
    end
    assert_match 'That is not a word', err.message
  end
end