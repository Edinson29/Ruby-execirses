# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
class Major_Palindromo
  def palindromo_of_3_numbers
    palindrome = 0
    999.downto(100) do |position|
      position.downto(100) do |position2|
        product = position*position2
        next unless product.to_s  == product.to_s.reverse && product > palindrome
        palindrome = product
      end
    end
    palindrome
  end
end
palindromo_Major = Major_Palindromo.new
puts palindromo_Major.palindromo_of_3_numbers