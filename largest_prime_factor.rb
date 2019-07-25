# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class LargestPrimeFactor
  def is_prime?(number = 0)
    number = number.to_i
    tests = Array (2..Math.sqrt(number))
    tests = tests.select { |x| number % x == 0 }
    tests.empty?
  end
  def factor(number = 0)
    number = number.to_i
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