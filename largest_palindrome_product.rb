# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
class MajorPalindromo
  def initialize(digits)
    @start = (10 ** digits) / 10
    @top = (10 ** digits) - 1
  end
  def palindromo
    palindrome = 0
    @top.downto(@start) do |position|
      position.downto(@start) do |position2|
        product = position*position2
        next unless product.to_s  == product.to_s.reverse && product > palindrome
        palindrome = product
      end
    end
    palindrome
  end
end
palindromo_major = MajorPalindromo.new(3)
puts palindromo_major.palindromo