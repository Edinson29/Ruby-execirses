# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class LargestPrimeFactor
  def factor(number = 0)
    multi, largest = 1, nil
    (2..number/2).each do |x|
      next unless number % x == 0 
      largest = x
      multi *= x
      number /= x
    end
    largest
  end
end
largest_pf = LargestPrimeFactor.new
puts largest_pf.factor(600851475143)