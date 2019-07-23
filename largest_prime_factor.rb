# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class LargestPrimeFactor
  def is_prime?(number = 0)     
    tests = Array (2..Math.sqrt(number))
    tests = tests.select { |x| number % x == 0 } 
    tests.empty? ? true : false
  end
  def factor(number = 0)
    counter = 2
    prime = 0
    while counter <= number
      if (number % counter == 0) && is_prime?(counter)
        prime = counter
        number /= counter
      end
      counter+=1
    end
    prime
    end
end
largest_pf = LargestPrimeFactor.new
puts largest_pf.factor(600851475143)