=begin
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end
def palindromo
  palindrome = []
  (100..999).each do |position|
    (100..999).each do |position2|
      product = position*position2
      #Here i converted the whole to array
      numberArray = product.to_s.chars.map(&:to_i)
      arrayInvert = numberArray.reverse
      next unless numberArray == arrayInvert
      palindrome = numberArray
    end
  end
  #return the array to integer
  numPalindromo = palindrome.join.to_i
end
puts palindromo