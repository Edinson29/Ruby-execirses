=begin
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end
def factor(number=0)
  multi,largest = 1,nil
  (2..number/2).each do |x|
    next unless number % x == 0 
    largest = x
    multi *= x    
    number /= x
  end
  largest
end
puts factor(600851475143)