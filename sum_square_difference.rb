#The sum of the squares of the first ten natural numbers is,
#12 + 22 + ... + 102 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)2 = 552 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class Sum_Square_Difference
  def sum_of_the_squares(num = 1)
    (1..num).inject { |result, n| result + n ** 2 }
  end
  def square_of_the_sum(num = 1)
    respuest = 0
    (1..num).inject { |result, n| respuest = result + n }
    respuest ** 2
  end
  def square_differentiator
    square_of_the_sum(100) - sum_of_the_squares(100)
  end
end
sum = Sum_Square_Difference.new
puts sum.square_differentiator