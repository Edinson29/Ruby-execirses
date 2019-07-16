=begin
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end  
end
def palindromo
  multipliers = []
  (100..999).each do |x|
    (100..999).each do |j|
      variable = x*j
      #Here i converted the whole to array
      numberArray = variable.to_s.chars.map(&:to_i)
      arrayInvert = numberArray.reverse
      next unless numberArray == arrayInvert
      @variable = variable2
      multipliers.push(x,j)
    end
  end
  #return the array to integer
  print multipliers
  variable = @variable.join.to_i
end
puts palindromo