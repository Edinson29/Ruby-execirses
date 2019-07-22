# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

def prime(prime = 0)    
  counter = 2
  finisher = 4
  arrayPrime = [2, 3]
  until arrayPrime.length == prime
    if arrayPrime.all? { |num| finisher % num != 0 }
      arrayPrime << finisher
    end
    finisher +=1 
  end
  arrayPrime.last
end
puts prime(10001)