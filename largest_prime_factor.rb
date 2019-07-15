def factor(number = 500)
  array = []
  multi = 1
  (2..number/2).each do |x| 
    if number % x == 0 
      multi *= x
      largest = x
      number /= x
    end
  end
  largest
end
puts factor(600851475143)