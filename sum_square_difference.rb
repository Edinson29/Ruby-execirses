#The sum of the squares of the first ten natural numbers is,
#12 + 22 + ... + 102 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)2 = 552 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class SumSquareDifference
  def initialize(num1 = 0, num2 = 0)
    @num1 = num1
    @num2 = num2
  end
  def sum_of_the_squares(num1)
    (1..num1).inject { |result, n| result + n ** 2 }
  end
  def square_of_the_sum(num2)
    respuest = 0
    (1..num2).inject { |result, n| respuest = result + n }
    respuest ** 2
  end
  def square_differentiator
    square_of_the_sum(@num1) - sum_of_the_squares(@num2)
  end
end
sum = SumSquareDifference.new(100, 100)
puts sum.square_differentiator