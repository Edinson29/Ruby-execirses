require 'minitest/autorun'
require '../palindromo.rb'

class PalindromoTest < Minitest::Test
  def test_palindromo_for_funcionality
    letter = LettersPalindromo.new('oso')
    assert letter.palindromo?
  end
  def test_palindromo_for_a_palindromo
    letter = LettersPalindromo.new('oso')
    assert true, letter.palindromo?
  end
  def test_palindromo_for_a_not_palindromo
    letter = LettersPalindromo.new('hoja')
    assert_equal false, letter.palindromo?
  end
  def test_factorial_for_words
    err = assert_raises(TypeError) do
      letter = LettersPalindromo.new('oc0')
      letter.palindromo?
    end
    assert_match 'That is not a word', err.message
  end
end