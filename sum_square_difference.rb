#The sum of the squares of the first ten natural numbers is,
#12 + 22 + ... + 102 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)2 = 552 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class SumSquareDifference
  def initialize(num1 = 0, num2 = 0)
    @num1 = parse_num(num1)
    @num2 = parse_num(num2)
  end
  def parse_num(num1)
    raise TypeError, 'That is not number' unless is_number?(num1)
    num1.to_i
  end
  def parse_num(num2)
    raise TypeError, 'That is not number' unless is_number?(num2)
    num2.to_i
  end
  def is_number?(num1)
    puts num1.to_s == num1.to_i.to_s
  end
  def is_number?(num2)
    num2.to_s == num2.to_i.to_s
  end
  def sum_of_the_squares
    (1..@num1).inject { |result, n| result + n ** 2 }
  end
  def square_of_the_sum
    respuest = 0
    (1..@num2).inject { |result, n| respuest = result + n }
    respuest ** 2
  end
  def square_differentiator
    square_of_the_sum - sum_of_the_squares
  end
end