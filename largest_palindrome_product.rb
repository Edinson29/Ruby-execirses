# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
class StringError < StandardError; end

class MajorPalindromo
  def initialize(digits = 0)
    @digits = parse_digits(digits)
  end
  def start
    (10 ** @digits) / 10
  end
  def top
    (10 ** @digits) - 1
  end
  def is_number?(obj)
    obj.to_s == obj.to_i.to_s
  end
  def parse_digits(digits)
    raise StringError, 'Ese no es un numero' unless is_number?(digits)
    digits.to_i
  end
  def palindromo
    palindrome = 0
    top.downto(start) do |position|
      position.downto(start) do |position2|
        product = position*position2
        next unless product.to_s  == product.to_s.reverse && product > palindrome
        palindrome = product
      end
    end
    palindrome
  end
end