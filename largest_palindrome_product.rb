=begin
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end
def palindromo_of_3_numbers
  palindrome = 0
  999.downto(500) do |position|
    position.downto(500) do |position2|
      product = position*position2
      next unless product.to_s  == product.to_s.reverse && product > palindrome
      palindrome = product
    end
  end
  palindrome
end
puts palindromo_of_3_numbers