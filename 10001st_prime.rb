# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

class Last_Prime
  def prime(prime = 0)
    # Top is the variable that is increased to be divided among the prime numbers,
    # if the top variable is not divided by any prime number it becomes a prime
    # number and is added to the array of prime numbers.
    top = 4
    array_prime = [2, 3]
    until array_prime.length == prime
      if array_prime.all? { |num| top % num != 0 }
        array_prime << top
      end
      top +=1 
    end
    array_prime.last
  end
end
last_prime = Last_Prime.new
puts last_prime.prime(10001)